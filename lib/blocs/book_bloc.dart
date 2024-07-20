import 'package:book_app/models/book_model.dart';
import 'package:book_app/repositories/book_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookBloc extends Cubit<List<Book>> {
  final BookRepository _bookRepository;

  BookBloc(this._bookRepository) : super([]) {
    // fetchBooks();
  }

  void fetchBooks() async {
    try {
      final books = await _bookRepository.getBooks();
      emit(books);
    } catch (e) {
      emit([]);
      print('Error fetching books: $e');
    }
  }
}
