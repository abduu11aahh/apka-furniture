// Product_cubit.dart
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:Apka_Furniture/bloc/productBloc/product_state.dart';
import 'package:Apka_Furniture/data/models/product_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';

import 'package:jwt_decoder/jwt_decoder.dart';

class ProductCubit extends Cubit<ProductState> {
  //product upload logic
  List<XFile> selectedImages = [];
  List<String> selectedStringImages = [];
  String title = '';
  String category = '';
  String details = '';

  ProductCubit() : super(ProductInitialState());

  void selectImages(List<XFile> images) {
    selectedImages = images.take(5).toList();
    emit(ImagesSelectedState(selectedImages));
  }

  // void selectStringImages(List<String> images) {
  //   print('ooooooooooooooooooooo$images');
  //   selectedStringImages = images;
  //   emit(StringImagesSelectedState(images));
  // }

  Future<void> submitProduct(String token) async {
    try {
      if (selectedImages.isNotEmpty) {
        emit(ProductSubmitLoadingState(selectedImages));
      } else {
        emit(StringProductSubmitLoadingState(selectedStringImages));
      }

      final imageUrls;
      if (selectedImages.isNotEmpty) {
        imageUrls = await _uploadImages(selectedImages);
      } else {
        imageUrls = selectedStringImages;
      }

      print('tokennnnnnnnnnnnnn$imageUrls ');
      final productData = ProductModel(
        images: imageUrls,
        title: title,
        category: category,
        details: details,
      );
      final apiUrl =
          'https://furniture-api-ceom.onrender.com/api/product/uploadproduct';
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(productData.toJson()),
      );
      if (response.statusCode == 200) {
        /////////////get quote logic for buyer
        Map<String, dynamic>? decodedToken = JwtDecoder.decode(token);
        if (decodedToken['role'] == 'buyer') {
          List<int> productIds = [];
          final productId = jsonDecode(response.body)['productId'];
          productIds.add(productId);
          final apiUrl =
              'https://furniture-api-ceom.onrender.com/api/quote/addquote';
          final response2 = await http.post(
            Uri.parse(apiUrl),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: jsonEncode(productIds),
          );
          if (response2.statusCode == 200) {
            print(
                'responseeeeeeeeeeeeddddddddddddddddd${jsonDecode(response2.body)}');
            emit(ProductSubmitSuccessState());
          } else {
            ProductSubmitErrorState('${jsonDecode(response.body)['message']}');
          }
        } else {
          emit(ProductSubmitSuccessState());
        }
        ////////////////////////
      } else {
        emit(
            ProductSubmitErrorState('${jsonDecode(response.body)['message']}'));
      }
    } catch (error) {
      emit(ProductSubmitErrorState(error.toString()));
    }
  }

  Future<List<String>> _uploadImages(List<XFile> images) async {
    List<String> imageUrls = [];
    String contentType;
    for (var image in images) {
      final imageName = DateTime.now().millisecondsSinceEpoch.toString();
      final path = 'images/$imageName';
      final ref = FirebaseStorage.instance.ref().child(path);

      if (image.path.toLowerCase().endsWith('.jpg') ||
          image.path.toLowerCase().endsWith('.jpeg')) {
        contentType = 'image/jpeg';
      } else if (image.path.toLowerCase().endsWith('.png')) {
        contentType = 'image/png';
      } else {
        contentType = 'application/octet-stream';
      }
      final file = File(image.path);
      await ref.putFile(
        file,
        SettableMetadata(contentType: contentType),
      );
      final imageUrl = await ref.getDownloadURL();
      imageUrls.add(imageUrl);
    }
    return imageUrls;
  }

  void resetState() {
    selectedImages = [];
    emit(ImagesSelectedState(selectedImages));
    emit(ProductInitialState());
  }

  //product fetch logic from database
  Future<void> fetchProducts({String? category}) async {
    try {
      emit(ProductFetchLoadingState());

      // Construct the base API URL
      // String apiUrl =
      //     'https://furniture-api-ceom.onrender.com/api/product/fetchproducts';

      String apiUrl =
          'https://furniture-api-ceom.onrender.com/api/product/fetchproducts';

      // Add the optional category parameter if provided
      if (category != null) {
        apiUrl += '?category=$category';
      }

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> productsJson =
            jsonDecode(response.body)['products'];
        List<ProductModel> products =
            productsJson.map((json) => ProductModel.fromJson(json)).toList();
        emit(ProductFetchSuccessState(products));
      } else {
        emit(ProductFetchErrorState('${jsonDecode(response.body)['message']}'));
      }
    } catch (error) {
      emit(ProductFetchErrorState(error.toString()));
    }
  }

//product fetch logic from database

  Future<void> fetchProductsbySeller(String token, {String? category}) async {
    try {
      emit(ProductFetchLoadingState());
      String apiUrl =
          'https://furniture-api-ceom.onrender.com/api/product/fetchProductsbySeller';
      if (category != null) {
        apiUrl += '?category=$category';
      }

      // final apiUrl =
      //   'https://furniture-api-ceom.onrender.com/api/product/fetchProductsbySeller';
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> productsJson =
            jsonDecode(response.body)['products'];
        //print('hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii ${response.body}');
        List<ProductModel> products =
            productsJson.map((json) => ProductModel.fromJson(json)).toList();

        emit(ProductFetchSuccessState(products));
      } else {
        emit(ProductFetchErrorState('${jsonDecode(response.body)['message']}'));
      }
    } catch (error) {
      emit(ProductFetchErrorState(error.toString()));
    }
  }

  // Function to add or remove a products from the ProductFetchSuccessState
  void addProduct(ProductModel newProduct) {
    if (state is ProductFetchSuccessState) {
      final List<ProductModel> updatedProducts =
          List.from((state as ProductFetchSuccessState).products);
      //updatedProducts.add(newProduct);
      updatedProducts.insert(0, newProduct);
      emit(ProductFetchSuccessState(updatedProducts));
    }
  }

  void removeProduct(ProductModel productToRemove) {
    if (state is ProductFetchSuccessState) {
      final List<ProductModel> updatedProducts =
          List.from((state as ProductFetchSuccessState).products);
      updatedProducts.remove(productToRemove);
      emit(ProductFetchSuccessState(updatedProducts));
    }
  }
}
