import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Apka_Furniture/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class QuoteBedState {}

// Bed Quotes
class BedQuoteInitialState extends QuoteBedState {}

class BedQuoteLoadingState extends QuoteBedState {}

class BedQuoteSuccessState extends QuoteBedState {
  final List<QuoteModel> bedQuotes;

  BedQuoteSuccessState(this.bedQuotes);
}

class BedQuoteErrorState extends QuoteBedState {
  final String error;

  BedQuoteErrorState(this.error);
}

class BedQuoteCubit extends Cubit<QuoteBedState> {
  BedQuoteCubit() : super(BedQuoteInitialState());

  void getAllQuotes(String token) async {
    try {
      emit(BedQuoteLoadingState());
      final apiUrl =
          'https://furniture-api-ceom.onrender.com/api/quote//getallquotes';
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      //print('responseeeeeeeddddddddd${jsonDecode(response.body)['allQuotes']}');

      if (response.statusCode == 200) {
        List<dynamic> bedQuotesJson =
            (jsonDecode(response.body)['allQuotes'] as List<dynamic>)
                .expand((obj) => (obj['Bed'] as List<dynamic>?) ?? [])
                .toList();

        List<QuoteModel> bedQuotes =
            bedQuotesJson.map((json) => QuoteModel.fromJson(json)).toList();

        emit(BedQuoteSuccessState(bedQuotes));
      } else {
        emit(BedQuoteErrorState('${jsonDecode(response.body)['message']}'));
      }
    } catch (error) {
      emit(BedQuoteErrorState('Error getting quotes: $error'));
    }
  }
}
