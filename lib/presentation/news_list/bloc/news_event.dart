part of 'news_bloc.dart';

@immutable
sealed class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object?> get props => [];
}

class TriggerNewsList extends NewsEvent {
  final String category;
  final List<NewsModel> newsList;

  const TriggerNewsList(
      {required this.category, this.newsList = const <NewsModel>[]});

  @override
  List<Object?> get props => [category, newsList];
}
