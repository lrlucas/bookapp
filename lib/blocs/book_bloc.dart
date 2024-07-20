import 'package:book_app/models/book_model.dart';
import 'package:book_app/repositories/book_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookBloc extends Cubit<List<Book>> {
  final BookRepository _bookRepository;

  List<Book> books = [];

  BookBloc(this._bookRepository) : super([]);

  void fetchBooks() async {
    try {
      books = await _bookRepository.getBooks();
      emit(books);
    } catch (e) {
      emit([]);
      print('Error fetching books: $e');
    }
  }

  void filterBooks(String query) {
    final filteredBooks = books
        .where((book) => book.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(filteredBooks);
  }

  void clearFilter() {
    emit(books);
  }
}
