import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Apka_Furniture/bloc/cartBloc/cart_state.dart';
import '../../data/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(cartItems: []));

  // Add a product to the cart
  void addToCart(ProductModel product) {
    final List<ProductModel> updatedCart = List.from(state.cartItems);
    if (!updatedCart.contains(product)) {
      updatedCart.add(product);
      emit(CartState(cartItems: updatedCart));
    }
  }

  // Remove a product from the cart
  void removeFromCart(ProductModel product) {
    final List<ProductModel> updatedCart = List.from(state.cartItems);
    updatedCart.remove(product);
    emit(CartState(cartItems: updatedCart));
  }

  // Check if there is any item in the cart
  bool get hasMoreThanOneItem => state.cartItems.length >= 1;

  Future<void> addQuote(String token) async {
    try {
      emit(CartState(cartItems: state.cartItems, status: QuoteStatus.loading));

      List<int?> productIds =
          state.cartItems.map((product) => product.productId).toList();

      final apiUrl =
          'https://furniture-api-ceom.onrender.com/api/quote/addquote';
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(productIds),
      );

      if (response.statusCode == 200) {
        print('Quote request successful: ${response.body}');
        List<int?> productIds = state.cartItems
            .map((productModel) => productModel.productId)
            .toList();
        emit(CartState(
            cartItems: [],
            status: QuoteStatus.success,
            productIds: productIds));
      } else {
        print('Quote request failed: ${response.body}');
        emit(CartState(
          cartItems: state.cartItems,
          status: QuoteStatus.error,
          errorMessage: 'Failed to request quote',
        ));
      }
    } catch (error) {
      print('Error getting quote: $error');
      emit(CartState(
        cartItems: state.cartItems,
        status: QuoteStatus.error,
        errorMessage: 'Error getting quote',
      ));
    }
  }

//+++++++++++++++++++++++++++++++++++++++
  List<int?> getProductIds() {
    return state.productIds;
  }
}
