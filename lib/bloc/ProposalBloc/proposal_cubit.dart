import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/ProposalBloc/proposal_state.dart';
import 'package:frontend/data/models/bid_model.dart';
import 'package:frontend/data/models/proposal_model.dart';
// import 'package:frontend/bloc/QuoteBloc/quote_state.dart';
// import 'package:frontend/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

class ProposalCubit extends Cubit<ProposalState> {
  ProposalCubit() : super(ProposalInitialState());

  void getProposalforQuote(String token, List<int?> productIds) async {
    try {
      print('hellooooooooooooo product ids$productIds');
      emit(ProposalLoadingState());
      final apiUrl = 'https://furniture-api-ceom.onrender.com/api/bid/fetchbid';
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(productIds),
      );
      // print('responseeeeeeeeeeeeddddddddddddddddd${jsonDecode(response.body)}');
      if (response.statusCode == 200) {
        final List<dynamic> proposalsJson =
            jsonDecode(response.body)['summaryBidData'];
        //print('responseeeeeeeeeeeeddddddddddddddddd$proposalsJson');
        List<ProposalModel> proposals =
            proposalsJson.map((json) => ProposalModel.fromJson(json)).toList();
        //print('responseeeeeeeeeeee${proposals[0].product.images[0]}');
        emit(ProposalSuccessState(proposals));
      } else {
        emit(ProposalErrorState('${jsonDecode(response.body)['message']}'));
      }
    } catch (error) {
      print('erorrrrrrrrrrr$error');
      emit(ProposalErrorState('Error getting quotes: $error'));
    }
  }

//+++++++++++++++++++++++++++++++++++++++
  void onTapNegative(String token, ProposalModel? proposal) async {
    try {
      final List<ProposalModel> updatedProposals =
          List.from((state as ProposalSuccessState).proposals);
      updatedProposals.remove(proposal);
      emit(ProposalSuccessState(updatedProposals));

      final response = await http.put(Uri.parse(
              // 'https://furniture-api-ceom.onrender.com/api/bid/updatebidstatus/${proposal?.bidID}'),
              'https://furniture-api-ceom.onrender.com/api/bid/updatebidstatus/${proposal?.bidID}?bidStatus=rejected'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          });

      if (response.statusCode == 200) {
        print('Row updated successfully');
      } else {
        print('Failed to update row. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('erorrrrrrrrrrr$error');
    }
  }

  //+++++++++++++++++++++++++++++++++++++++
  void onTapConfirm(String token, ProposalModel? proposal) async {
    try {
      final List<ProposalModel> updatedProposals =
          List.from((state as ProposalSuccessState).proposals);
      updatedProposals.remove(proposal);
      emit(ProposalSuccessState(updatedProposals));

      final response = await http.put(
          Uri.parse(
              'https://furniture-api-ceom.onrender.com/api/bid/updatebidstatus/${proposal?.bidID}?bidStatus=accepted'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          });

      if (response.statusCode == 200) {
        print('Row updated successfully');
      } else {
        print('Failed to update row. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('erorrrrrrrrrrr$error');
    }
  }
}
