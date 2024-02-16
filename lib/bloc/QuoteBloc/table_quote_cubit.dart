import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Apka_Furniture/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class QuoteTableState {}

// Table Quotes
class TableQuoteInitialState extends QuoteTableState {}

class TableQuoteLoadingState extends QuoteTableState {}

class TableQuoteSuccessState extends QuoteTableState {
  final List<QuoteModel> tableQuotes;

  TableQuoteSuccessState(this.tableQuotes);
}

class TableQuoteErrorState extends QuoteTableState {
  final String error;

  TableQuoteErrorState(this.error);
}

class TableQuoteCubit extends Cubit<QuoteTableState> {
  TableQuoteCubit() : super(TableQuoteInitialState());

  void getAllQuotes(String token) async {
    try {
      emit(TableQuoteLoadingState());
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
        List<dynamic> tableQuotesJson =
            (jsonDecode(response.body)['allQuotes'] as List<dynamic>)
                .expand((obj) => (obj['Table'] as List<dynamic>?) ?? [])
                .toList();

        List<QuoteModel> TableQuotes =
            tableQuotesJson.map((json) => QuoteModel.fromJson(json)).toList();

        emit(TableQuoteSuccessState(TableQuotes));
      } else {
        emit(TableQuoteErrorState('${jsonDecode(response.body)['message']}'));
      }
    } catch (error) {
      emit(TableQuoteErrorState('Error getting quotes: $error'));
    }
  }
}
