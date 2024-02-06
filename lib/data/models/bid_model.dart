import 'quote_model.dart';

class BidModel {
  final int bidID;
  final double price;
  final int deliveryDays;
  final QuoteModel quote;

  BidModel({
    required this.bidID,
    required this.price,
    required this.deliveryDays,
    required this.quote,
  });

  factory BidModel.fromJson(Map<String, dynamic> json) {
    return BidModel(
      bidID: json['BidID'],
      price: double.parse(json['BidAmount']),
      deliveryDays: json['DeliveryDays'],
      quote: QuoteModel.fromJson(json['Quote']),
    );
  }
}
