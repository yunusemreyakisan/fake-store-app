import 'package:dio/dio.dart';
import 'package:fakestoreapp/data/services/api_service.dart';
import 'package:fakestoreapp/utils/constants.dart';

class ApiServiceImpl implements ApiService {
  final Dio _dio;
  ApiServiceImpl({required Dio dio}) : _dio = dio;

  //Get All Products
  @override
  Future<List<dynamic>> getAllProducts() async {
    try {
      // Make a GET request to the API endpoint to fetch user data.
      final response = await _dio.get(baseUrl);

      // Check if the response status code is 200 (OK).
      if (response.statusCode == 200) {
        return response
            .data; // If successful, return the response data (List of dynamic).
      } else {
        throw Exception('API failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // If any exception occurs during the API call, throw an exception with the error message.
      throw Exception('An error occurred: $e');
    }
  }
}
