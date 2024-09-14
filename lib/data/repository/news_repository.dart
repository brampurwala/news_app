

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:news_app/data/data_service/news_data_service.dart';
import 'package:news_app/data/model/news_model.dart';

import '../../common/functions/exception_handler.dart';

class NewsRepository {
  static Future<Either<Failure, NewsModel>> fetchSearchList(
      String category) async {
    try {
      final response = await NewsDataService.fetchNewsData(category);
      final result = response as Right<String, Map<String, dynamic>>;
      final newsModel = NewsModel.fromJson(result.value);

      return Right(newsModel);
    } catch (error) {
      final errorResponse = jsonDecode(error.toString());
      final statusCode = errorResponse['status_code'] as int;
      final statusMessage = errorResponse['status_message'] as String;
      return Left(Failure(code: statusCode, message: statusMessage));
    }
  }
}