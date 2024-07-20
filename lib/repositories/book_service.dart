import 'package:dio/dio.dart';
import '../models/book_model.dart';

class BookService {
  final Dio _dio = Dio();

  BookService() {
    _dio.options.baseUrl = 'https://reactnd-books-api.udacity.com';
    _dio.options.headers['Authorization'] = 'whatever-you-want';
  }

  Future<List<Book>> fetchBooks() async {
    try {
      final response = await _dio.get('/books');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['books'];
        final mapData = data.map((json) => Book.fromJson(json)).toList();
        return mapData;
      } else {
        throw Exception('Error fetching books: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching books: $e');
    }
  }
}
