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
  List<QuoteModel> totalQuotes = [];
  int currentPage = 2;
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

        List<QuoteModel> tableQuotes =
            tableQuotesJson.map((json) => QuoteModel.fromJson(json)).toList();
        totalQuotes.addAll(tableQuotes);
        emit(TableQuoteSuccessState(totalQuotes));
      } else {
        emit(TableQuoteErrorState('${jsonDecode(response.body)['message']}'));
      }
    } catch (error) {
      emit(TableQuoteErrorState('Please Check you Internet Connection!'));
    }
  }

  void getTenQuotes(String token) async {
    try {
      //emit(BedQuoteLoadingState());
      String category = 'Table';
      final apiUrl =
          'https://furniture-api-ceom.onrender.com/api/quote/gettenquotes?page=$currentPage&category=$category';
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      //print('responseeeeeeeddddddddd${jsonDecode(response.body)}');

      if (response.statusCode == 200) {
        final List<dynamic> quotesJson =
            jsonDecode(response.body)['tenQuotesOfCategory'];

        List<QuoteModel> bedQuotes =
            quotesJson.map((json) => QuoteModel.fromJson(json)).toList();
        print('responseeeeeeeeeeeeeeeee${bedQuotes.length}');

        if (bedQuotes.isEmpty) {
          // Consider it as reaching the maximum
          print('Reached maximum number of items.');
          print('totalquotessssssssssssssssssssss${totalQuotes.length}');
          emit(TableQuoteSuccessState(totalQuotes));
          return;
        }
        currentPage++;
        totalQuotes.addAll(bedQuotes);
        print('totalquotessssssssssssssssssssss${totalQuotes.length}');
        emit(TableQuoteSuccessState(totalQuotes));
      } else {
        currentPage--;
        emit(TableQuoteErrorState('${jsonDecode(response.body)['message']}'));
      }
    } catch (error) {
      print(error);
      currentPage--;
      emit(TableQuoteErrorState('Please Check you Internet Connection!'));
    }
  }
}
