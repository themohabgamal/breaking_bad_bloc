// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:breaking_bad_bloc/data/models/quote.dart';
import 'package:breaking_bad_bloc/data/web_services/quote_web_services.dart';

class QuoteRepository {
  QuoteWebServices quoteWebServices;
  QuoteRepository({
    required this.quoteWebServices,
  });
  Future<List<Quote>> getAllQuotes() async {
    final quotes = await quoteWebServices.getAllQuotes();
    return quotes.map((quote) => Quote.fromMap(quote)).toList();
  }
}
