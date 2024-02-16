import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Apka_Furniture/bloc/QuoteBloc/quote_state.dart';
import 'package:Apka_Furniture/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

class QuoteCubit extends Cubit<QuoteState> {
  QuoteCubit() : super(QuoteInitialState());

  // void getQuotesByCategory(String category, String token) async {
  //   try {
  //     emit(QuoteLoadingState());
  //     final apiUrl =
  //         'https://furniture-api-ceom.onrender.com/api/quote/getquotes?category=$category';
  //     final response = await http.get(
  //       Uri.parse(apiUrl),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       },
  //     );
  //     // print('responseeeeeeeeeeeeddddddddddddddddd${jsonDecode(response.body)}');
  //     if (response.statusCode == 200) {
  //       final List<dynamic> quotesJson =
  //           jsonDecode(response.body)['quotesWithProducts'];

  //       List<QuoteModel> quotes =
  //           quotesJson.map((json) => QuoteModel.fromJson(json)).toList();
  //       // print('responseeeeeeeeeeee${quotes[0].product.images[0]}');
  //       emit(QuoteSuccessState(quotes));
  //     } else {
  //       emit(QuoteErrorState('${jsonDecode(response.body)['message']}'));
  //     }
  //   } catch (error) {
  //     emit(QuoteErrorState('Error getting quotes: $error'));
  //   }
  // }

  void getQuotesOfBuyer(String token) async {
    try {
      emit(QuoteLoadingState());
      final apiUrl =
          'https://furniture-api-ceom.onrender.com/api/quote/getquotesofbuyer';
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      // print('responseeeeeeeeeeeeddddddddddddddddd${jsonDecode(response.body)}');
      if (response.statusCode == 200) {
        final List<dynamic> quotesJson =
            jsonDecode(response.body)['quotesWithProducts'];

        List<QuoteModel> quotes =
            quotesJson.map((json) => QuoteModel.fromJson(json)).toList();
        // print('responseeeeeeeeeeee${quotes[0].product.images[0]}');
        emit(QuoteSuccessState(quotes));
      } else {
        emit(QuoteErrorState('${jsonDecode(response.body)['message']}'));
      }
    } catch (error) {
      emit(QuoteErrorState('Error getting quotes: $error'));
    }
  }
}
