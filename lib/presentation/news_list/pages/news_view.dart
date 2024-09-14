import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/resources/app_color.dart';
import 'package:news_app/common/resources/app_strings.dart';

import '../../../common/widgets/custom_loader.dart';
import '../../../di/di.dart';
import '../../news_detail/pages/news_detail_view.dart';
import '../bloc/news_bloc.dart';
import 'package:news_app/data/model/news_model.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView>
    with SingleTickerProviderStateMixin {
  final NewsBloc _newsBloc = instance<NewsBloc>();

  final List<String> categories = [
    'Pilgrimage',
    'Devotional',
    'Sports',
    'Technology',
    'Business',
    'Entertainment'
  ];
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _newsBloc,
      child: BlocConsumer<NewsBloc, NewsState>(
        listener: (context, state) {
          if (state.message.isNotEmpty) {
            Center(
              child: Text(state.message),
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return CustomLoader(child: _buildLayout(context, state));
          } else {
            return _buildLayout(context, state);
          }
        },
      ),
    );
  }

  Widget _buildLayout(BuildContext context, NewsState state) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: const Text(
            AppStrings.news_list_header_text,
            style: TextStyle(
                color: AppColors.colorPrimaryInverse,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blue, width: 2),
                  // Border color and width
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
                child: DropdownButton<String>(
                  value: selectedCategory,
                  hint: const Text(
                    AppStrings.select_category_text,
                    style: TextStyle(color: AppColors.blue),
                  ),
                  underline: const SizedBox(),
                  // Hide the default underline
                  isExpanded: true,
                  // Make the dropdown button full width
                  items: categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(
                        category,
                        style: const TextStyle(color: AppColors.blue),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                    _newsBloc.add(TriggerNewsList(category: newValue!));
                  },
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                    itemCount: state.newsList.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final article = state.newsList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NewsDetailsScreen(article: article),
                            ),
                          );
                        },
                        child: _buildAnimatedNewsCard(article),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedNewsCard(Articles article) {
    return Hero(
      tag: article.urlToImage ?? UniqueKey().toString(),
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(14)),
              child: Image.network(
                article.urlToImage ?? 'https://picsum.photos/200/300',
                // Placeholder image URL
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                article.title.toString(),
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                article.description.toString(),
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
