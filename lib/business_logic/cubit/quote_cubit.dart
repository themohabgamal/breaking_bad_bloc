import 'package:bloc/bloc.dart';
import 'package:breaking_bad_bloc/data/models/quote.dart';
import 'package:breaking_bad_bloc/data/repository/quote_repository.dart';

part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  QuoteCubit(this.quoteRepository) : super(QuoteInitialState());
  List<Quote> quotes = [];
  late QuoteRepository quoteRepository;
  List<Quote> getAllQuotes() {
    quoteRepository.getAllQuotes().then((quotes) {
      emit(QuoteLoadedState(quotes: quotes));
      this.quotes = quotes;
    });
    return quotes;
  }
}
