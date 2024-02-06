import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/widgets/app_bar/appbar_title.dart';
import 'package:frontend/widgets/app_bar/custom_app_bar.dart';
import 'package:frontend/widgets/custom_elevated_button.dart';
import 'package:frontend/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class PaymentMethodTwoScreen extends StatelessWidget {
  PaymentMethodTwoScreen({Key? key}) : super(key: key);

  TextEditingController editTextController = TextEditingController();

  TextEditingController editTextController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 16.v),
                child: Column(children: [
                  _buildVectorRow(context),
                  SizedBox(height: 60.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 17.h),
                          child: Text("Card Holder Name",
                              style: theme.textTheme.bodyMedium))),
                  SizedBox(height: 10.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.h),
                      child: CustomTextFormField(
                          controller: editTextController,
                          borderDecoration:
                              TextFormFieldStyleHelper.fillBlueGray,
                          fillColor: appTheme.blueGray100)),
                  SizedBox(height: 17.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 17.h),
                          child: Text("Card Number",
                              style: theme.textTheme.bodyMedium))),
                  SizedBox(height: 10.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.h),
                      child: CustomTextFormField(
                          controller: editTextController1,
                          textInputAction: TextInputAction.done,
                          borderDecoration:
                              TextFormFieldStyleHelper.fillBlueGray,
                          fillColor: appTheme.blueGray100)),
                  SizedBox(height: 18.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 17.h, right: 96.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 1.v),
                                    child: Text("Expiry",
                                        style: theme.textTheme.bodyMedium)),
                                Text("CVC", style: theme.textTheme.bodyMedium)
                              ]))),
                  SizedBox(height: 8.v),
                  _buildViewRow(context),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildCheckOutButton(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(centerTitle: true, title: AppbarTitle(text: "Payment"));
  }

  /// Section Widget
  Widget _buildVectorRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 1.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(right: 7.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 53.h, vertical: 28.v),
                  decoration: AppDecoration.outlinePrimary.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder14),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                            imagePath:
                                ImageConstant.imgVectorOnprimarycontainer,
                            height: 26.v,
                            width: 23.h,
                            margin: EdgeInsets.only(left: 6.h)),
                        SizedBox(height: 5.v),
                        Text("Bank", style: CustomTextStyles.labelLarge13),
                        SizedBox(height: 2.v)
                      ]))),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(left: 7.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.h, vertical: 29.v),
                  decoration: AppDecoration.fillBlueGray.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder14),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgOfferOnprimarycontainer,
                            height: 26.adaptSize,
                            width: 26.adaptSize),
                        SizedBox(height: 5.v),
                        Opacity(
                            opacity: 0.5,
                            child: Text("Others",
                                style: CustomTextStyles
                                    .bodyMediumOnPrimaryContainer)),
                        SizedBox(height: 2.v)
                      ])))
        ]));
  }

  /// Section Widget
  Widget _buildViewRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              height: 50.v,
              width: 144.h,
              decoration: BoxDecoration(
                  color: appTheme.blueGray100,
                  borderRadius: BorderRadius.circular(10.h))),
          Container(
              height: 50.v,
              width: 135.h,
              decoration: BoxDecoration(
                  color: appTheme.blueGray100,
                  borderRadius: BorderRadius.circular(10.h)))
        ]));
  }

  /// Section Widget
  Widget _buildCheckOutButton(BuildContext context) {
    return CustomElevatedButton(
        text: "Check out",
        margin: EdgeInsets.only(left: 30.h, right: 30.h, bottom: 35.v),
        buttonStyle: CustomButtonStyles.fillPrimary,
        buttonTextStyle: CustomTextStyles.titleMediumWhiteA700SemiBold,
        onPressed: () {
          onTapCheckOutButton(context);
        });
  }

  /// Navigates to the paymentMethodThreeScreen when the action is triggered.
  onTapCheckOutButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.paymentMethodThreeScreen);
  }
}
