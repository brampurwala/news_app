
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/presentation/news_list/bloc/news_bloc.dart';

Future<void> handleNewsList({
  required TriggerNewsList event,
  required Emitter<NewsState> emit,
  required NewsState state,
}) async {
  emit(state.copyWith(isLoading: true));
  try{
  final result = await NewsRepository.fetchSearchList(event.category);
  result.fold(
        (failure) {
      // Emit failure state
      emit(state.copyWith(
        isLoading: false,
        message: failure.message,
      ));
    },
        (success) {
      // Emit success state
      emit(state.copyWith(
        newsList: success.articles!,
        isLoading: false,
      ));
    },
  );}catch(error){
    emit(state.copyWith(
      isLoading: false,
      message: error.toString()
    ));
  }
}