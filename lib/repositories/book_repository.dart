import '../models/book_model.dart';
import 'book_service.dart';

class BookRepository {
  final BookService _bookService = BookService();

  Future<List<Book>> getBooks() async {
    return await _bookService.fetchBooks();
  }
}
