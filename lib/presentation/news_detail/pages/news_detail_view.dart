import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/common/resources/app_color.dart';
import 'package:news_app/data/model/news_model.dart';

class NewsDetailsScreen extends StatelessWidget {
  final Articles article;

  const NewsDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            article.source!.name.toString(),
            style: const TextStyle(
                color: AppColors.colorPrimaryInverse,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.colorPrimaryInverse,
            ),
          ),
        ),
        body: Hero(
          tag: article.urlToImage ?? UniqueKey().toString(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    article.urlToImage ?? 'https://picsum.photos/200/300',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    article.title.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      color: AppColors.colorPrimaryInverse,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article.author ?? 'Unknown',
                    style: const TextStyle(
                      color: AppColors.colorPrimaryInverse,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    DateFormat.yMMMMd().format(
                      DateTime.parse(
                        article.publishedAt.toString(),
                      ),
                    ),
                    style: const TextStyle(
                      color: AppColors.colorPrimaryInverse,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    article.content.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.colorPrimaryInverse,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
