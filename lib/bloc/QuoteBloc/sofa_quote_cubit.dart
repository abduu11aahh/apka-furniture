import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Apka_Furniture/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class QuoteSofaState {}

// Sofa Quotes
class SofaQuoteInitialState extends QuoteSofaState {}

class SofaQuoteLoadingState extends QuoteSofaState {}

class SofaQuoteSuccessState extends QuoteSofaState {
  final List<QuoteModel> sofaQuotes;

  SofaQuoteSuccessState(this.sofaQuotes);
}

class SofaQuoteErrorState extends QuoteSofaState {
  final String error;

  SofaQuoteErrorState(this.error);
}

class SofaQuoteCubit extends Cubit<QuoteSofaState> {
  SofaQuoteCubit() : super(SofaQuoteInitialState());

  void getAllQuotes(String token) async {
    try {
      emit(SofaQuoteLoadingState());
      final apiUrl =
          'https://furniture-api-ceom.onrender.com/api/quote//getallquotes';
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      // print('responseeeeeeeddddddddd${jsonDecode(response.body)['allQuotes']}');

      if (response.statusCode == 200) {
        List<dynamic> sofaQuotesJson =
            (jsonDecode(response.body)['allQuotes'] as List<dynamic>)
                .expand((obj) => (obj['Sofa'] as List<dynamic>?) ?? [])
                .toList();

        List<QuoteModel> sofaQuotes =
            sofaQuotesJson.map((json) => QuoteModel.fromJson(json)).toList();

        emit(SofaQuoteSuccessState(sofaQuotes));
      } else {
        emit(SofaQuoteErrorState('${jsonDecode(response.body)['message']}'));
      }
    } catch (error) {
      emit(SofaQuoteErrorState('Error getting quotes: $error'));
    }
  }
}
