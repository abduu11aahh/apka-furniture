//import 'package:Apka_Furniture/data/models/Bid_model.dart';

import 'package:Apka_Furniture/data/models/bid_model.dart';

abstract class BidState {}

class BidInitialState extends BidState {}

class BidLoadingState extends BidState {}

class BidSuccessState extends BidState {
  BidSuccessState();
}

class BidErrorState extends BidState {
  final String error;

  BidErrorState(this.error);
}

class BidbySellerLoadingState extends BidState {}

class BidbySellerSuccessState extends BidState {
  final List<BidModel> bids;

  BidbySellerSuccessState(this.bids);
}

class BidbySellerErrorState extends BidState {
  final String error;

  BidbySellerErrorState(this.error);
}
