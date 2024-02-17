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
  List<QuoteModel> totalQuotes = [];
  int currentPage = 2;
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
        totalQuotes.addAll(sofaQuotes);
        emit(SofaQuoteSuccessState(totalQuotes));
      } else {
        emit(SofaQuoteErrorState('${jsonDecode(response.body)['message']}'));
      }
    } catch (error) {
      emit(SofaQuoteErrorState('Please Check you Internet Connection!'));
    }
  }

  void getTenQuotes(String token) async {
    try {
      //emit(BedQuoteLoadingState());
      String category = 'Sofa';
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
          emit(SofaQuoteSuccessState(totalQuotes));
          return;
        }
        currentPage++;
        totalQuotes.addAll(bedQuotes);
        print('totalquotessssssssssssssssssssss${totalQuotes.length}');
        emit(SofaQuoteSuccessState(totalQuotes));
      } else {
        currentPage--;
        emit(SofaQuoteErrorState('${jsonDecode(response.body)['message']}'));
      }
    } catch (error) {
      print(error);
      currentPage--;
      emit(SofaQuoteErrorState('Please Check you Internet Connection!'));
    }
  }
}
