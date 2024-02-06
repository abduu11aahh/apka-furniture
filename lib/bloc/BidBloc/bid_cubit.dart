import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/BidBloc/bid_state.dart';
import 'package:frontend/data/models/bid_model.dart';
// import 'package:frontend/bloc/QuoteBloc/quote_state.dart';
// import 'package:frontend/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

class BidCubit extends Cubit<BidState> {
  BidCubit() : super(BidInitialState());

  void addBid(int price, int deliverDays, int quoteId, String token) async {
    try {
      emit(BidLoadingState());
      final apiUrl = 'https://furniture-api-ceom.onrender.com/api/bid/addbid';
      final Map<String, dynamic> requestBody = {
        'price': price,
        'deliveryDays': deliverDays,
        'quoteId': quoteId,
      };
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        emit(BidSuccessState());
      } else {
        emit(BidErrorState('${jsonDecode(response.body)['message']}'));
      }
    } catch (error) {
      emit(BidErrorState('Error getting quotes: $error'));
    }
  }

  void getBidBySeller(String token) async {
    try {
      emit(BidbySellerLoadingState());
      final apiUrl =
          'https://furniture-api-ceom.onrender.com/api/bid/fetchbidbyseller';
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        // print(
        //     'responseeeeeeeeeeeeddddddddddddddddd${jsonDecode(response.body)['BidData']}');
        final List<dynamic> bidsJson = jsonDecode(response.body)['BidData'];
        List<BidModel> bids =
            bidsJson.map((json) => BidModel.fromJson(json)).toList();
        emit(BidbySellerSuccessState(bids));
      } else {
        emit(BidbySellerErrorState('${jsonDecode(response.body)['message']}'));
      }
    } catch (error) {
      //print('erooooooooooooor$error');
      emit(BidErrorState('Error getting quotes: $error'));
    }
  }
}
