import 'package:frontend/data/models/product_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProductState {
  const ProductState();
}

class ProductInitialState extends ProductState {}

class ImagesSelectedState extends ProductState {
  final List<XFile> selectedImages;

  ImagesSelectedState(this.selectedImages);
}

class StringImagesSelectedState extends ProductState {
  final List<String> selectedImages;

  StringImagesSelectedState(this.selectedImages);
}

class StringProductSubmitLoadingState extends ProductState {
  final List<String> selectedImages;

  StringProductSubmitLoadingState(this.selectedImages);
}

class ProductSubmitLoadingState extends ProductState {
  final List<XFile> selectedImages;

  ProductSubmitLoadingState(this.selectedImages);
}

class ProductSubmitSuccessState extends ProductState {}

class ProductSubmitErrorState extends ProductState {
  final String error;

  ProductSubmitErrorState(this.error);
}

//product fetch states

class ProductFetchLoadingState extends ProductState {}

class ProductFetchSuccessState extends ProductState {
  final List<ProductModel> products;

  ProductFetchSuccessState(this.products);
}

class ProductFetchErrorState extends ProductState {
  final String errorMessage;

  ProductFetchErrorState(this.errorMessage);
}
