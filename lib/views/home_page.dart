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
            child: BlocProvider(
              create: (context) => BookBloc(_bookRepository),
              child: BookGrid(),
            ),
          ),
        ],
      ),
      // body: BookGrid(),
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
        print('VISTA');
        print(books.length);
        if (books.isEmpty) {
          return const Center(child: CircularProgressIndicator.adaptive());
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
                print('Click para ir al detalle');
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
                // localImagePath: 'assets/images/book_1.jpg',
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
