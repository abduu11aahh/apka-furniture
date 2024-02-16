import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Apka_Furniture/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class QuoteOthersState {}

// Others Quotes
class OthersQuoteInitialState extends QuoteOthersState {}

class OthersQuoteLoadingState extends QuoteOthersState {}

class OthersQuoteSuccessState extends QuoteOthersState {
  final List<QuoteModel> othersQuotes;

  OthersQuoteSuccessState(this.othersQuotes);
}

class OthersQuoteErrorState extends QuoteOthersState {
  final String error;

  OthersQuoteErrorState(this.error);
}

class OthersQuoteCubit extends Cubit<QuoteOthersState> {
  OthersQuoteCubit() : super(OthersQuoteInitialState());

  void getAllQuotes(String token) async {
    try {
      emit(OthersQuoteLoadingState());
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
        List<dynamic> othersQuotesJson =
            (jsonDecode(response.body)['allQuotes'] as List<dynamic>)
                .expand((obj) => (obj['Others'] as List<dynamic>?) ?? [])
                .toList();

        List<QuoteModel> othersQuotes =
            othersQuotesJson.map((json) => QuoteModel.fromJson(json)).toList();

        emit(OthersQuoteSuccessState(othersQuotes));
      } else {
        emit(OthersQuoteErrorState('${jsonDecode(response.body)['message']}'));
      }
    } catch (error) {
      emit(OthersQuoteErrorState('Error getting quotes: $error'));
    }
  }
}
