import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Apka_Furniture/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class QuoteChairState {}

// Chair Quotes
class ChairQuoteInitialState extends QuoteChairState {}

class ChairQuoteLoadingState extends QuoteChairState {}

class ChairQuoteSuccessState extends QuoteChairState {
  final List<QuoteModel> chairQuotes;

  ChairQuoteSuccessState(this.chairQuotes);
}

class ChairQuoteErrorState extends QuoteChairState {
  final String error;

  ChairQuoteErrorState(this.error);
}

class ChairQuoteCubit extends Cubit<QuoteChairState> {
  ChairQuoteCubit() : super(ChairQuoteInitialState());

  void getAllQuotes(String token) async {
    try {
      emit(ChairQuoteLoadingState());
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
        List<dynamic> chairQuotesJson =
            (jsonDecode(response.body)['allQuotes'] as List<dynamic>)
                .expand((obj) => (obj['Chair'] as List<dynamic>?) ?? [])
                .toList();

        List<QuoteModel> chairQuotes =
            chairQuotesJson.map((json) => QuoteModel.fromJson(json)).toList();

        emit(ChairQuoteSuccessState(chairQuotes));
      } else {
        emit(ChairQuoteErrorState('${jsonDecode(response.body)['message']}'));
      }
    } catch (error) {
      emit(ChairQuoteErrorState('Error getting quotes: $error'));
    }
  }
}
