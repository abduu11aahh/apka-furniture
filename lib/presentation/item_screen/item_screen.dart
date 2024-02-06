import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/cartBloc/cart_cubit.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/data/models/product_model.dart';
import 'package:frontend/presentation/buyer_creating_new_item_screen/buyer_creating_new_item_screen.dart';
import 'package:frontend/presentation/seller_creating_new_item_screen/seller_creating_new_item_screen.dart';
import 'package:frontend/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:frontend/widgets/app_bar/appbar_title.dart';
import 'package:frontend/widgets/app_bar/custom_app_bar.dart';
import 'package:frontend/widgets/custom_elevated_button.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final ProductModel product =
        ModalRoute.of(context)?.settings.arguments as ProductModel;
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 12.v),
                child: Column(children: [
                  SizedBox(height: 15.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.h, right: 25.h, bottom: 5.v),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //_buildWidgetImages(context),
                                    _buildImageCarousel(
                                        context, product.images),
                                    SizedBox(height: 27.v),
                                    Container(
                                        width: 308.h,
                                        child: Text(product.title,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.titleLarge)),
                                    SizedBox(height: 5.v),
                                    CustomElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  BuyerCreatingNewItemScreen(
                                                      product: product),
                                            ),
                                          );
                                        },
                                        height: 30.v,
                                        width: 85.h,
                                        text: "Upon Demand",
                                        buttonStyle:
                                            CustomButtonStyles.fillLightBlue,
                                        buttonTextStyle: theme
                                            .textTheme.labelSmall
                                            ?.copyWith(
                                                color: appTheme.lightBlue)),
                                    SizedBox(height: 13.v),
                                    Divider(),
                                    SizedBox(height: 9.v),
                                    Text("Description",
                                        style: theme.textTheme.titleSmall),
                                    SizedBox(height: 9.v),
                                    Opacity(
                                        opacity: 0.55,
                                        child: Text(product.details,
                                            style:
                                                theme.textTheme.labelMedium)),
                                    //SizedBox(height: 3.v),
                                    // Opacity(
                                    //     opacity: 0.55,
                                    //     child: Text("Material : Wood",
                                    //         style:
                                    //             theme.textTheme.labelMedium)),
                                    // SizedBox(height: 3.v),
                                    // Opacity(
                                    //     opacity: 0.55,
                                    //     child: Text(
                                    //         "Leg Material : 20 cm Up wood",
                                    //         style:
                                    //             theme.textTheme.labelMedium)),
                                    // SizedBox(height: 2.v),
                                    // Opacity(
                                    //     opacity: 0.55,
                                    //     child: Text("Fabric Material : Linen",
                                    //         style:
                                    //             theme.textTheme.labelMedium)),
                                    // SizedBox(height: 3.v),
                                    // Opacity(
                                    //     opacity: 0.55,
                                    //     child: Text("Wood : Swedish",
                                    //         style:
                                    //             theme.textTheme.labelMedium)),
                                    SizedBox(height: 13.v),
                                    // Text("Specifications",
                                    //     style: CustomTextStyles
                                    //         .titleSmallOnPrimaryContainer),
                                    // SizedBox(height: 10.v),
                                    // Padding(
                                    //     padding: EdgeInsets.only(
                                    //         left: 12.h, right: 86.h),
                                    //     child: Row(
                                    //         mainAxisAlignment:
                                    //             MainAxisAlignment.spaceBetween,
                                    //         children: [
                                    //           Text("Length (cm) :",
                                    //               style: theme
                                    //                   .textTheme.labelMedium),
                                    //           Text("200",
                                    //               style: theme
                                    //                   .textTheme.labelMedium)
                                    //         ])),
                                    // SizedBox(height: 4.v),
                                    // Padding(
                                    //     padding: EdgeInsets.only(left: 4.h),
                                    //     child: _buildPerson(context,
                                    //         userName: "Width (cm) :",
                                    //         userNumber: "120")),
                                    // SizedBox(height: 4.v),
                                    // Padding(
                                    //     padding: EdgeInsets.only(
                                    //         left: 12.h, right: 72.h),
                                    //     child: Row(
                                    //         mainAxisAlignment:
                                    //             MainAxisAlignment.spaceBetween,
                                    //         children: [
                                    //           Text("Size :",
                                    //               style: theme
                                    //                   .textTheme.labelMedium),
                                    //           Text("Family",
                                    //               style: theme
                                    //                   .textTheme.labelMedium)
                                    //         ])),
                                    // SizedBox(height: 4.v),
                                    // Padding(
                                    //     padding: EdgeInsets.only(left: 4.h),
                                    //     child: _buildPerson(context,
                                    //         userName: "Person :",
                                    //         userNumber: "Three"))
                                  ]))))
                ])),
            bottomNavigationBar: _buildAddToCartButton(context, product)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
        surfaceTintColor: Colors.white,
        leadingWidth: 75.h,
        toolbarHeight: 65.v,
        leading: InkWell(
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
        centerTitle: true,
        title: AppbarTitle(text: "Product Detail"));
    ;
  }

  Widget _buildImageCarousel(BuildContext context, List<String> images) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250.0,
        enlargeCenterPage: true,
        autoPlay: false,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0)),
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
  // Widget _buildWidgetImages(BuildContext context) {
  //   return Container(
  //       padding: EdgeInsets.symmetric(vertical: 16.v),
  //       decoration: BoxDecoration(
  //           color: appTheme.gray, borderRadius: BorderRadius.circular(10.h)),
  //       child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
  //         CustomImageView(
  //             imagePath: ImageConstant.imgRectangle24,
  //             height: 235.v,
  //             width: 188.h,
  //             radius: BorderRadius.circular(5.h)),
  //         Column(children: [
  //           CustomImageView(
  //               imagePath: ImageConstant.imgRectangle24,
  //               height: 73.v,
  //               width: 79.h,
  //               radius: BorderRadius.circular(5.h)),
  //           SizedBox(height: 9.v),
  //           CustomImageView(
  //               imagePath: ImageConstant.imgRectangle24,
  //               height: 71.v,
  //               width: 79.h,
  //               radius: BorderRadius.circular(5.h)),
  //           SizedBox(height: 9.v),
  //           CustomImageView(
  //               imagePath: ImageConstant.imgRectangle24,
  //               height: 73.v,
  //               width: 79.h,
  //               radius: BorderRadius.circular(5.h))
  //         ])
  //       ]));
  // }

  /// Section Widget
  Widget _buildAddToCartButton(BuildContext context, ProductModel product) {
    return CustomElevatedButton(
        text: "Add to cart",
        margin: EdgeInsets.only(left: 30.h, right: 30.h, bottom: 25.v),
        buttonStyle: CustomButtonStyles.fillPrimary,
        buttonTextStyle: theme.textTheme.titleMedium!.copyWith(
          color: appTheme.white,
        ),
        onPressed: () {
          context.read<CartCubit>().addToCart(product);
          Navigator.pushNamed(context, AppRoutes.cartScreen);
        });
  }

  /// Common widget
  // Widget _buildPerson(
  //   BuildContext context, {
  //   required String userName,
  //   required String userNumber,
  // }) {
  //   return Container(
  //       padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 5.v),
  //       decoration: AppDecoration.fillPrimary
  //           .copyWith(borderRadius: BorderRadiusStyle.roundedBorder3),
  //       child:
  //           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  //         Padding(
  //             padding: EdgeInsets.only(bottom: 1.v),
  //             child: Text(userName,
  //                 style: theme.textTheme.labelMedium!.copyWith(
  //                     color: theme.colorScheme.onPrimaryContainer
  //                         .withOpacity(1)))),
  //         Padding(
  //             padding: EdgeInsets.only(right: 69.h, bottom: 1.v),
  //             child: Text(userNumber,
  //                 style: theme.textTheme.labelMedium!.copyWith(
  //                     color:
  //                         theme.colorScheme.onPrimaryContainer.withOpacity(1))))
  //       ]));
  // }

  /// Navigates to the userHomeScreen when the action is triggered.
  onTapIconButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.userHomeScreen);
  }

  /// Navigates to the cartScreenOneTabContainerScreen when the action is triggered.
  onTapAddToCartButton(BuildContext context, ProductModel product) {}
}
