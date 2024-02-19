import 'dart:ui';
import 'dart:io';
import 'package:Apka_Furniture/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Apka_Furniture/bloc/AuthBloc/auth_cubit.dart';
import 'package:Apka_Furniture/bloc/bottomBarBloc/bottomBarCubit.dart';
import 'package:Apka_Furniture/bloc/productBloc/product_cubit.dart';
import 'package:Apka_Furniture/bloc/productBloc/product_state.dart';
import 'package:Apka_Furniture/core/app_export.dart';
import 'package:Apka_Furniture/data/models/product_model.dart';
import 'package:Apka_Furniture/presentation/cart_screen/cart_screen.dart';
import 'package:Apka_Furniture/presentation/cart_screen_dialog/cart_screen_dialog.dart';
import 'package:Apka_Furniture/presentation/user_home_screen/user_home_screen.dart';
import 'package:Apka_Furniture/widgets/app_bar/appbar_title.dart';
import 'package:Apka_Furniture/widgets/custom_bottom_app_bar.dart';
import 'package:Apka_Furniture/widgets/custom_elevated_button.dart';
import 'package:Apka_Furniture/widgets/custom_text_form_field.dart';
import 'package:image_picker/image_picker.dart';
import 'widgets/category_widget.dart';
import 'package:Apka_Furniture/presentation/blur_buyer_creating_new_item_screen/blur_buyer_creating_new_item_screen.dart';

// ignore_for_file: must_be_immutable

class BuyerCreatingNewItemScreen extends StatefulWidget {
  final ProductModel? product;

  BuyerCreatingNewItemScreen({Key? key, this.product}) : super(key: key);
  @override
  _BuyerCreatingNewItemScreenState createState() =>
      _BuyerCreatingNewItemScreenState();
}

class _BuyerCreatingNewItemScreenState
    extends State<BuyerCreatingNewItemScreen> {
  bool isBlur = false;
  String selectedCategory = '';
  TextEditingController itemTitleController = TextEditingController();
  TextEditingController itemDetailController = TextEditingController();
  @override
  void initState() {
    super.initState();
    selectedCategory = widget.product != null ? widget.product!.category : '';
    itemTitleController.text =
        widget.product != null ? widget.product!.title : '';
    itemDetailController.text =
        widget.product != null ? widget.product!.details : '';
  }

  @override
  Widget build(BuildContext context) {
    // Assuming you have a ThemeData named 'theme' declared somewhere
    print('hhhhhhhhh ${widget.product?.title ?? "Default Title"}');
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 12.v),
                child: Column(children: [
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(left: 0.h),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildAppBar(context),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 15.h,
                                          right: 15.h,
                                          top: 15.v,
                                          bottom: 30.v),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          BlocBuilder<ProductCubit,
                                              ProductState>(
                                            builder: (context, state) {
                                              if (state
                                                  is ImagesSelectedState) {
                                                return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              "Upload upto 5 images",
                                                              style: theme
                                                                  .textTheme
                                                                  .titleLarge,
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              context
                                                                  .read<
                                                                      ProductCubit>()
                                                                  .resetState();
                                                            },
                                                            child: Icon(
                                                              Icons.delete,
                                                              color: Colors
                                                                  .red, // Choose your preferred color
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 14.v),
                                                      _buildImageCarousel(
                                                          context,
                                                          images: state
                                                              .selectedImages),
                                                    ]);
                                              } else if (state
                                                  is ProductSubmitLoadingState) {
                                                return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              "Upload upto 5 images",
                                                              style: theme
                                                                  .textTheme
                                                                  .titleLarge,
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              context
                                                                  .read<
                                                                      ProductCubit>()
                                                                  .resetState();
                                                            },
                                                            child: Icon(
                                                              Icons.delete,
                                                              color: Colors
                                                                  .red, // Choose your preferred color
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 14.v),
                                                      _buildImageCarousel(
                                                          context,
                                                          images: state
                                                              .selectedImages),
                                                    ]);
                                              } else if (state
                                                  is StringProductSubmitLoadingState) {
                                                return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              "Upload upto 5 images",
                                                              style: theme
                                                                  .textTheme
                                                                  .titleLarge,
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              context
                                                                  .read<
                                                                      ProductCubit>()
                                                                  .resetState();
                                                            },
                                                            child: Icon(
                                                              Icons.delete,
                                                              color: Colors
                                                                  .red, // Choose your preferred color
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 14.v),
                                                      _buildImageCarousel(
                                                          context,
                                                          product:
                                                              widget.product),
                                                    ]);
                                              } else {
                                                return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          "Upload upto 5 images",
                                                          style: theme.textTheme
                                                              .titleLarge),
                                                      SizedBox(height: 14.v),
                                                      widget.product == null
                                                          ? _buildUploadImages(
                                                              context)
                                                          : _buildImageCarousel(
                                                              context,
                                                              product: widget
                                                                  .product),
                                                    ]);
                                              }
                                            },
                                          ),
                                          SizedBox(height: 28.v),
                                          Text("Categories",
                                              style:
                                                  theme.textTheme.titleLarge),
                                          SizedBox(height: 15.v),
                                          _buildCategory(context),
                                          SizedBox(height: 24.v),
                                          Text("Title",
                                              style:
                                                  theme.textTheme.titleMedium),
                                          SizedBox(height: 12.v),
                                          _title(context),
                                          SizedBox(height: 17.v),
                                          Text("Detail about item",
                                              style:
                                                  theme.textTheme.titleMedium),
                                          SizedBox(height: 14.v),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.h, right: 8.h),
                                              child: CustomTextFormField(
                                                  maxLines: 4,
                                                  alignment: Alignment.center,
                                                  controller:
                                                      itemDetailController)),
                                        ],
                                      ),
                                    ),
                                    _buildUpload(context,
                                        product: widget.product)
                                  ]))))
                ])),
            if (isBlur)
              GestureDetector(
                onTap: () {
                  setState(() {
                    isBlur = false;
                  });
                },
                child: AnimatedOpacity(
                  opacity: 1.0,
                  duration: Duration(milliseconds: 300),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
            if (isBlur)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    //decoration: BoxDecoration(color: Colors.),
                    height: 150.v,
                    child: _uploadWidget(context)),
              )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _uploadWidget(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 43.h, vertical: 40.v),
        decoration: BoxDecoration(
            color: appTheme.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 50.h, bottom: 4.v),
              child: GestureDetector(
                onTap: () {
                  _onTapPhone(context);
                },
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgClose,
                      height: 25.v,
                      width: 27.h),
                  SizedBox(height: 11.v),
                  Opacity(
                      opacity: 0.75,
                      child:
                          Text("My Phone", style: theme.textTheme.labelLarge))
                ]),
              )),
          Padding(
              padding: EdgeInsets.only(left: 50.h, bottom: 6.v),
              child: GestureDetector(
                onTap: () {
                  _onTapCamera(context);
                },
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgSettings,
                      height: 25.v,
                      width: 27.h),
                  SizedBox(height: 9.v),
                  Opacity(
                      opacity: 0.75,
                      child: Text("Camera", style: theme.textTheme.labelLarge))
                ]),
              ))
        ]));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
        leadingWidth: 60.h,
        toolbarHeight: 60.v,
        surfaceTintColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 0.h),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            highlightColor: Colors.transparent,
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: appTheme.gray, // Change the color as needed
              ),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 22.0,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: AppbarTitle(text: "Create New"));
  }

  /// Section Widget
  Widget _buildUploadImages(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.h),
            padding: EdgeInsets.symmetric(horizontal: 135.h, vertical: 42.v),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: theme.colorScheme.primary.withOpacity(0.5)),
            child: InkWell(
              onTap: () {
                onTapBtnPlus(context);
              },
              child: Container(
                height: 40.adaptSize,
                width: 40.adaptSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white, // Change the color as needed
                ),
                child: Center(
                  child: Icon(Icons.add,
                      size: 23.adaptSize, color: theme.colorScheme.primary),
                ),
              ),
            )));
  }

  Widget _buildImageCarousel(BuildContext context,
      {List<XFile>? images, ProductModel? product}) {
    // if (product != null) {
    //   context.read<ProductCubit>().selectStringImages(product.images);
    // } else {
    //   print('nulllllllllllllll');
    // }

    //print('kkkkkkkkkkkkkkkkkkkkkkkkk');
    return CarouselSlider(
      options: CarouselOptions(
        height: 150.0,
        enlargeCenterPage: true,
        autoPlay: false,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: product == null
          ? images!.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Image.file(File(image.path), fit: BoxFit.fitWidth),
                  );
                },
              );
            }).toList()
          : product.images.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ));
                },
              );
            }).toList(),
    );
  }

  /// Section Widget
  Widget _buildCategory(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 87.v,
        child: ListView(
          padding: EdgeInsets.only(
            right: 22.h,
          ),
          scrollDirection: Axis.horizontal,
          children: [
            CategoryWidget(
              text: "Bed",
              imagePath: ImageConstant.imgPngegg31,
              color: Colors.cyan,
              isSelected: selectedCategory == "Bed",
              onTap: () => _onCategorySelected(context, "Bed"),
            ),
            CategoryWidget(
              text: "Chair",
              imagePath: ImageConstant.chair,
              color: Colors.yellow,
              isSelected: selectedCategory == "Chair",
              onTap: () => _onCategorySelected(context, "Chair"),
            ),
            CategoryWidget(
              text: "Sofa",
              imagePath: ImageConstant.sofa,
              color: Colors.orange,
              isSelected: selectedCategory == "Sofa",
              onTap: () => _onCategorySelected(context, "Sofa"),
            ),
            CategoryWidget(
              text: "Table",
              imagePath: ImageConstant.imgPngegg51,
              color: Colors.lightBlue,
              isSelected: selectedCategory == "Table",
              onTap: () => _onCategorySelected(context, "Table"),
            ),
            CategoryWidget(
              text: "Others",
              imagePath: ImageConstant.all,
              color: appTheme.gray400,
              isSelected: selectedCategory == "Others",
              onTap: () => _onCategorySelected(context, "Others"),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _title(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
          padding: EdgeInsets.only(left: 10.h, right: 8.h),
          child: CustomTextFormField(
              controller: itemTitleController, alignment: Alignment.center)),
    );
  }

  /// Section Widget
  Widget _buildUpload(BuildContext context, {ProductModel? product}) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        if (state is ProductSubmitSuccessState) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text("Upload successful!"),
          //   ),
          // );
          // Navigator.pushNamedAndRemoveUntil(
          //   context,
          //   AppRoutes.bottomBarScreen,
          //   (route) => false,
          // );

          Navigator.pop(context);
          context
              .read<BottomBarCubit>()
              .setCurrentTab(1, CartScreen(initialTabIndex: 1));
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => CartScreen(initialTabIndex: 1),
          //   ),
          // );
        }
        if (state is ProductSubmitErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              //content: Text(state.error),
              content: Text(
                  'Something went wrong! Please check your internet connection and try again!'),
            ),
          );
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        if (state is ProductSubmitLoadingState ||
            state is StringProductSubmitLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
            ),
          );
        }
        return CustomElevatedButton(
            text: "Get Quote",
            margin: EdgeInsets.only(left: 30.h, right: 30.h, bottom: 37.v),
            buttonStyle: CustomButtonStyles.fillPrimary,
            buttonTextStyle:
                theme.textTheme.titleMedium!.copyWith(color: appTheme.white),
            onPressed: () {
              onTapUpload(context, product: product);
            });
      },
    );
  }

  onTapBtnPlus(BuildContext context) {
    setState(() {
      isBlur = true;
    });
  }

  void _onCategorySelected(BuildContext context, String categoryName) {
    setState(() {
      selectedCategory = categoryName;
    });
  }

  Future<void> _onTapPhone(BuildContext context) async {
    final pickedImages = await ImagePicker().pickMultiImage(imageQuality: 85);
    if (pickedImages != null && pickedImages.isNotEmpty) {
      context.read<ProductCubit>().selectImages(pickedImages);
    }
  }

  Future<void> _onTapCamera(BuildContext context) async {
    List<XFile> selectedImages = [];
    int i = 0;
    while (i < 5) {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedFile == null) {
        // User canceled image capture
        break;
      }

      //final imagePath = pickedFile.path;
      selectedImages.add(pickedFile);
      i++;
    }
    if (selectedImages.isNotEmpty) {
      context.read<ProductCubit>().selectImages(selectedImages);
    }
  }

  /// Navigates to the userHomeScreen when the action is triggered.
  onTapUpload(BuildContext context, {ProductModel? product}) {
    String token = context.read<AuthCubit>().getToken();

    final state = context.read<ProductCubit>().state;
    bool call;
    if (product == null) {
      call = selectedCategory != '' &&
          itemDetailController.text != '' &&
          itemTitleController.text != '' &&
          (state is ImagesSelectedState);
    } else {
      context.read<ProductCubit>().selectedStringImages = product.images;
      call = selectedCategory != '' &&
          itemDetailController.text != '' &&
          itemTitleController.text != '';
    }

    if (call) {
      context.read<ProductCubit>().title = itemTitleController.text.toString();
      context.read<ProductCubit>().details =
          itemDetailController.text.toString();
      context.read<ProductCubit>().category = selectedCategory;
      //String token = context.read<AuthCubit>().getToken();
      //if token available or not
      if (token != '') {
        context.read<ProductCubit>().submitProduct(token);
      } else {
        globalIsPreviousBuyerNewItemScreen = true;
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: CartScreenDialog(),
                  backgroundColor: Colors.transparent,
                  contentPadding: EdgeInsets.zero,
                  insetPadding: const EdgeInsets.only(left: 0),
                ));
      }
      //context.read<ProductCubit>().submitProduct(token);
    } else {
      String snackBarContent = '';
      if (selectedCategory == '') {
        snackBarContent = 'Please select the category!';
      } else if (itemTitleController.text == '') {
        snackBarContent = 'Please fill the title of the product!';
      } else if (itemDetailController.text == '') {
        snackBarContent = 'Please fill the details of the product!';
      } else {
        snackBarContent = 'Please upload images for the product!';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$snackBarContent'),
        ),
      );
    }
    //context.read<CartCubit>().addQuote(token);

    // final state = context.read<ProductCubit>().state;
    // if (selectedCategory != '' &&
    //     itemDetailController.text != '' &&
    //     itemTitleController != '' &&
    //     state is ImagesSelectedState &&
    //     state.selectedImages.isNotEmpty) {
    //   context.read<ProductCubit>().title = itemTitleController.text.toString();
    //   context.read<ProductCubit>().details =
    //       itemDetailController.text.toString();
    //   context.read<ProductCubit>().category = selectedCategory;
    //   String token = context.read<AuthCubit>().getToken();
    //   context.read<ProductCubit>().submitProduct(token);
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('Please fill each field!'),
    //     ),
    //   );
    // }
  }
}
