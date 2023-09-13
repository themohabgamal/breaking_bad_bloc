// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Quote {
  String quote;
  String author;
  Quote({
    required this.quote,
    required this.author,
  });

  Quote copyWith({
    String? quote,
    String? author,
  }) {
    return Quote(
      quote: quote ?? this.quote,
      author: author ?? this.author,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quote': quote,
      'author': author,
    };
  }

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      quote: map['quote'] as String,
      author: map['author'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Quote.fromJson(String source) =>
      Quote.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Quote(quote: $quote, author: $author)';

  @override
  bool operator ==(covariant Quote other) {
    if (identical(this, other)) return true;

    return other.quote == quote && other.author == author;
  }

  @override
  int get hashCode => quote.hashCode ^ author.hashCode;
}
