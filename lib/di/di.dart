import 'package:get_it/get_it.dart';
import 'package:news_app/presentation/news_list/bloc/news_bloc.dart';

final instance = GetIt.instance;

Future<void> initModule() async {
  if (!GetIt.I.isRegistered<NewsBloc>()) {
    instance.registerFactory<NewsBloc>(() => NewsBloc());
  }
}
