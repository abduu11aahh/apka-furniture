import 'package:Apka_Furniture/data/models/product_model.dart';

enum QuoteStatus { initial, loading, success, error }

class CartState {
  final List<ProductModel> cartItems;
  final QuoteStatus status;
  final List<int?> productIds; //for getting proposals for the cart items
  final String? errorMessage;

  const CartState({
    required this.cartItems,
    this.status = QuoteStatus.initial,
    this.errorMessage,
    this.productIds = const [],
  });
}
