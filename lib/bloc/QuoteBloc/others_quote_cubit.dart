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

List<QuoteModel> totalQuotes = [];
int currentPage = 2;

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
        totalQuotes.addAll(othersQuotes);
        emit(OthersQuoteSuccessState(totalQuotes));
      } else {
        emit(OthersQuoteErrorState('${jsonDecode(response.body)['message']}'));
      }
    } catch (error) {
      emit(OthersQuoteErrorState('Please Check you Internet Connection!'));
    }
  }

  void getTenQuotes(String token) async {
    try {
      //emit(BedQuoteLoadingState());
      String category = 'Other';
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
          emit(OthersQuoteSuccessState(totalQuotes));
          return;
        }
        currentPage++;
        totalQuotes.addAll(bedQuotes);
        print('totalquotessssssssssssssssssssss${totalQuotes.length}');
        emit(OthersQuoteSuccessState(totalQuotes));
      } else {
        currentPage--;
        emit(OthersQuoteErrorState('${jsonDecode(response.body)['message']}'));
      }
    } catch (error) {
      print(error);
      currentPage--;
      emit(OthersQuoteErrorState('Please Check you Internet Connection!'));
    }
  }
}
