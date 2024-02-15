import 'package:Apka_Furniture/data/models/quote_model.dart';

abstract class QuoteState {}

class QuoteInitialState extends QuoteState {}

class QuoteLoadingState extends QuoteState {}

class QuoteSuccessState extends QuoteState {
  final List<QuoteModel> quotes;

  QuoteSuccessState(this.quotes);
}

class QuoteErrorState extends QuoteState {
  final String error;

  QuoteErrorState(this.error);
}
