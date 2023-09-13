// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quote_cubit.dart';

abstract class QuoteState {}

class QuoteInitialState extends QuoteState {}

class QuoteLoadedState extends QuoteState {
  List<Quote> quotes;
  QuoteLoadedState({
    required this.quotes,
  });
}
