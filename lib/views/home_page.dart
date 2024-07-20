import 'package:book_app/blocs/book_bloc.dart';
import 'package:book_app/models/book_model.dart';
import 'package:book_app/repositories/book_repository.dart';
import 'package:book_app/views/book_detail.dart';
import 'package:book_app/views/widgets/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BookRepository _bookRepository = BookRepository();
  TextEditingController _searchController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
    _searchController.addListener(() {
      context.read<BookBloc>().filterBooks(_searchController.text);
    });
  }

  void _clearSearch() {
    _searchController.clear();
    context.read<BookBloc>().clearFilter();
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          'MyReads',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: _searchController,
              focusNode: _focusNode,
              cursorColor: Colors.green,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 1.0),
                ),
                labelText: 'Search',
                floatingLabelStyle: TextStyle(color: Colors.green),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.close,
                      color: _isFocused ? Colors.green : Colors.grey),
                  focusColor: Colors.green,
                  onPressed: _clearSearch,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              SizedBox(width: 10),
              Text(
                'Currently Reading',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const Divider(thickness: 0.8),
          const SizedBox(height: 10),
          Expanded(
            child: BookGrid(),
          ),
        ],
      ),
    );
  }
}

class BookGrid extends StatefulWidget {
  const BookGrid({
    super.key,
  });

  @override
  State<BookGrid> createState() => _BookGridState();
}

class _BookGridState extends State<BookGrid> {
  final List<Map<String, String>> booksFake = [
    {
      'imageUrl': 'assets/images/placeholder_book.png',
      'title': 'The Book of Basketball',
      'authors': 'Bill Simmons, Malcolm Gladwell'
    },
    {
      'imageUrl': 'assets/images/placeholder_book.png',
      'title': 'Cricket',
      'authors': 'Shaharyar M. Khan'
    },
    {
      'imageUrl': 'assets/images/placeholder_book.png',
      'title': 'The Linux Command Line',
      'authors': 'William Shotts'
    },
    {
      'imageUrl': 'assets/images/placeholder_book.png',
      'title': 'Learning React Native',
      'authors': 'Bonnie Eisenman'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bookBloc = context.read<BookBloc>();
    bookBloc.fetchBooks();
    return BlocBuilder<BookBloc, List<Book>>(
      builder: (context, books) {
        if (books.isEmpty) {
          return const Center(child: Text('No hay libros disponibles'));
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Numero de columnas
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.6, // Relacion de aspecto de los elementos
          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            final data = books[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetail(
                      book: data,
                    ),
                  ),
                );
              },
              child: BookCard(
                imageUrl: data.imageUrl,
                title: data.title,
                authors: data.authors,
                subtitle: data.subtitle,
              ),
            );
          },
        );
      },
    );
  }
}
