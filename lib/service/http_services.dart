import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class HttpServices {
  final String baseUrl;

  HttpServices(this.baseUrl);

  Future<Either<String, Map<String, dynamic>>> _makeRequest(
      String method,
      String endpoint, {
        Map<String, String>? headers,
        Object? body,
      }) async {
    final url = Uri.parse('$baseUrl$endpoint');
    http.Response response;

    try {
      switch (method) {
        case 'POST':
          response = await http.post(
            url,
            headers: headers,
            body: jsonEncode(body),
          ).timeout(const Duration(seconds: 10));
          break;
        case 'PUT':
          response = await http.put(
            url,
            headers: headers,
            body: jsonEncode(body),
          ).timeout(const Duration(seconds: 10));
          break;
        case 'DELETE':
          response = await http.delete(
            url,
            headers: headers,
          ).timeout(const Duration(seconds: 10));
          break;
        case 'GET':
        default:
          response = await http.get(
            url,
            headers: headers,
          ).timeout(const Duration(seconds: 10));
          break;
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Attempt to decode JSON, but return the raw body if decoding fails
        try {
          final decodedJson = jsonDecode(response.body) as Map<String, dynamic>;
          return Right(decodedJson);
        } catch (e) {
          return Right({'raw': response.body});
        }
      } else {
        return Left('Failed to load data: ${response.reasonPhrase}');
      }
    } catch (error) {
      return Left('Error occurred: $error');
    }
  }

  Future<Either<String, Map<String, dynamic>>> get(
      String endpoint, {
        Map<String, String>? headers,
      }) {
    return _makeRequest('GET', endpoint, headers: headers);
  }

  Future<Either<String, Map<String, dynamic>>> post(
      String endpoint, {
        Map<String, String>? headers,
        Object? body,
      }) {
    return _makeRequest('POST', endpoint, headers: headers, body: body);
  }

  Future<Either<String, Map<String, dynamic>>> put(
      String endpoint, {
        Map<String, String>? headers,
        Object? body,
      }) {
    return _makeRequest('PUT', endpoint, headers: headers, body: body);
  }

  Future<Either<String, Map<String, dynamic>>> delete(
      String endpoint, {
        Map<String, String>? headers,
      }) {
    return _makeRequest('DELETE', endpoint, headers: headers);
  }
}
