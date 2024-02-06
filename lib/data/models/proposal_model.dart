import 'product_model.dart';

class ProposalModel {
  final int summaryBidID;
  final int bidID;
  final int quoteID;
  final double price;
  final int deliveryDays;
  final ProductModel product;

  ProposalModel({
    required this.summaryBidID,
    required this.bidID,
    required this.quoteID,
    required this.price,
    required this.deliveryDays,
    required this.product,
  });

  factory ProposalModel.fromJson(Map<String, dynamic> json) {
    return ProposalModel(
      summaryBidID: json['SummaryBidID'],
      bidID: json['Bid']['BidID'],
      quoteID: json['Bid']['Quote']['QuoteID'],
      price: double.parse(json['DerivedPrice']),
      deliveryDays: json['DerivedDeliveryDays'],
      product: ProductModel.fromJson(json['Bid']['Quote']['Product']),
    );
  }
}
