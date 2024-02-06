import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'widgets/category_widget.dart';
import 'package:frontend/widgets/app_bar/appbar_title.dart';
import 'package:frontend/widgets/custom_elevated_button.dart';
import 'package:frontend/widgets/custom_text_form_field.dart';
import 'dart:ui';

class BlurBuyerCreatingNewItemScreen extends StatelessWidget {
  const BlurBuyerCreatingNewItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        //appBar: _buildAppBar(context),
        body: Stack(
          children: [
            Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 12.v),
                child: Column(children: [
                  // SizedBox(height: 15.v),
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
                                          left: 15.h, right: 15.h, top: 15.v),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Upload upto 5 images",
                                              style:
                                                  theme.textTheme.titleLarge),
                                          SizedBox(height: 14.v),
                                          _buildUploadImages(context),
                                          SizedBox(height: 28.v),
                                          Text("Categories",
                                              style:
                                                  theme.textTheme.titleLarge),
                                          SizedBox(height: 15.v),
                                          _buildCategory(context),
                                          SizedBox(height: 24.v),
                                          Text("Delivery Date",
                                              style:
                                                  theme.textTheme.titleMedium),
                                          SizedBox(height: 12.v),
                                          _deliveryDate(context),
                                          SizedBox(height: 17.v),
                                          Text("Detail about item",
                                              style:
                                                  theme.textTheme.titleMedium),
                                          SizedBox(height: 14.v),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.h, right: 8.h),
                                              child: CustomTextFormField(
                                                  maxLines: 3,
                                                  alignment: Alignment.center)),
                                        ],
                                      ),
                                    ),
                                  ]))))
                ])),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
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
              padding: EdgeInsets.only(bottom: 6.v),
              child: Column(children: [
                CustomImageView(
                    imagePath: ImageConstant.imgSettings,
                    height: 25.v,
                    width: 27.h),
                SizedBox(height: 9.v),
                Opacity(
                    opacity: 0.75,
                    child: Text("Camera", style: theme.textTheme.labelLarge))
              ])),
          Padding(
              padding: EdgeInsets.only(left: 50.h, bottom: 4.v),
              child: Column(children: [
                CustomImageView(
                    imagePath: ImageConstant.imgClose,
                    height: 25.v,
                    width: 27.h),
                SizedBox(height: 11.v),
                Opacity(
                    opacity: 0.75,
                    child: Text("My Phone", style: theme.textTheme.labelLarge))
              ])),
          Padding(
              padding: EdgeInsets.only(left: 50.h, bottom: 6.v),
              child: Column(children: [
                CustomImageView(
                    imagePath: ImageConstant.imgGroupOnprimarycontainer25x25,
                    height: 25.v,
                    width: 27.h),
                SizedBox(height: 9.v),
                Opacity(
                    opacity: 0.75,
                    child: Text("Drive", style: theme.textTheme.labelLarge))
              ]))
        ]));
  }

  /// Navigates back to the previous screen.
  onTapImgClose(BuildContext context) {
    Navigator.pop(context);
  }
}

PreferredSizeWidget _buildAppBar(BuildContext context) {
  return AppBar(
      leadingWidth: 60.h,
      toolbarHeight: 80.v,
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

/// Section Widget
Widget _buildCategory(BuildContext context) {
  return Align(
    alignment: Alignment.center,
    child: SizedBox(
      height: 72.v,
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
          ),
          CategoryWidget(
            text: "Chair",
            imagePath: ImageConstant.imgPngegg31,
            color: Colors.yellow,
          ),
          CategoryWidget(
            text: "Sofa",
            imagePath: ImageConstant.imgPngegg31,
            color: Colors.orange,
          ),
          CategoryWidget(
            text: "Table",
            imagePath: ImageConstant.imgPngegg31,
            color: Colors.lightBlue,
          ),
          CategoryWidget(
            text: "Bed",
            imagePath: ImageConstant.imgPngegg31,
            color: Colors.pink,
          ),
          CategoryWidget(
            text: "Sofa",
            imagePath: ImageConstant.imgPngegg31,
            color: Colors.orange,
          )
        ],
      ),
    ),
  );
}

/// Section Widget
Widget _deliveryDate(BuildContext context) {
  return Align(
      alignment: Alignment.center,
      // child: Container(
      //     width: 311.h,
      //     margin: EdgeInsets.symmetric(horizontal: 9.h),
      //     padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 12.v),
      //     decoration: BoxDecoration(
      //         color: appTheme.gray200,
      //         borderRadius: BorderRadius.circular(5)),
      //     child: CustomImageView(
      //         imagePath: ImageConstant.imgVectorBlueGray900,
      //         height: 15.adaptSize,
      //         width: 15.adaptSize))
      child: Stack(children: [
        Padding(
            padding: EdgeInsets.only(left: 10.h, right: 8.h),
            child: CustomTextFormField(alignment: Alignment.center)),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 20.h, top: 20.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgVectorBlueGray900,
                height: 15.adaptSize,
                width: 15.adaptSize),
          ),
        )
      ]));
}

/// Section Widget
Widget _buildGetQuote(BuildContext context) {
  return CustomElevatedButton(
      text: "Get Quote",
      margin: EdgeInsets.only(left: 30.h, right: 30.h, bottom: 37.v),
      buttonStyle: CustomButtonStyles.fillPrimary,
      buttonTextStyle:
          theme.textTheme.titleMedium!.copyWith(color: appTheme.white),
      onPressed: () {
        onTapGetQuote(context);
      });
}

/// Navigates to the userHomeScreen when the action is triggered.
onTapIconButton(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.userHomeScreen);
}

onTapBtnPlus(BuildContext context) {}

/// Navigates to the userHomeScreen when the action is triggered.
onTapGetQuote(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.userHomeScreen);
}
