import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/presentation/news_list/bloc/news_event_handlers.dart';

import '../../../common/resources/app_strings.dart';


part 'news_event.dart';

part 'news_state.dart';

part 'news_bloc.freezed.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsState.initial()) {
    on<TriggerNewsList>(_onTriggerNewsList);
  }

  FutureOr<void> _onTriggerNewsList(
      TriggerNewsList event, Emitter<NewsState> emit) async {
    await handleNewsList(event: event, emit: emit, state: state);
  }
}
