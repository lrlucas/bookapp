class Book {
  final String id;
  final String title;
  final String authors;
  final String imageUrl;
  final String description;
  final int pageCount;
  final String publishedDate;
  final String subtitle;

  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.imageUrl,
    required this.description,
    required this.pageCount,
    required this.publishedDate,
    required this.subtitle,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    final String authorString = (json['authors'] as List<dynamic>).join(', ');
    final data = Book(
      id: json['id'],
      title: json['title'],
      authors: authorString,
      imageUrl: json['imageLinks']['thumbnail'],
      description: json['description'],
      pageCount: json['pageCount'] ?? 0,
      publishedDate: json['publishedDate'] ?? '2000',
      subtitle: json['subtitle'] ?? '',
    );
    return data;
  }
}
