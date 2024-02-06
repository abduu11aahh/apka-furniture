import 'product_model.dart';

class QuoteModel {
  final int quoteId;
  final ProductModel product;

  QuoteModel({
    required this.quoteId,
    required this.product,
  });

  Map<String, dynamic> toJson() => {
        'quoteId': quoteId,
        'product': product.toJson(),
      };

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      quoteId: json['QuoteID'],
      product: ProductModel.fromJson(json['Product']),
    );
  }
}
