part of 'news_bloc.dart';


@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    required String message,
    required bool isLoading,
    required String selectedCategory,
    required List<Articles> newsList,
  }) = _NewsState;

  factory NewsState.initial() => const NewsState(
    message: AppStrings.global_empty_string,
    isLoading: false,
    selectedCategory: AppStrings.global_empty_string,
    newsList: [],
  );
}