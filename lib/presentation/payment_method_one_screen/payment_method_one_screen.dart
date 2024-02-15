import 'package:flutter/material.dart';
import 'package:Apka_Furniture/core/app_export.dart';
import 'package:Apka_Furniture/widgets/app_bar/appbar_title.dart';
import 'package:Apka_Furniture/widgets/app_bar/custom_app_bar.dart';
import 'package:Apka_Furniture/widgets/custom_elevated_button.dart';

class PaymentMethodOneScreen extends StatelessWidget {
  const PaymentMethodOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 26.h, top: 159.v, right: 26.h),
                child: Column(children: [
                  _buildCreditCard(context),
                  SizedBox(height: 15.v),
                  _buildPaymentMethodOne(context),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(centerTitle: true, title: AppbarTitle(text: "Payment"));
  }

  /// Section Widget
  Widget _buildCreditCard(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapCreditCard(context);
        },
        child: Container(
            margin: EdgeInsets.only(left: 1.h),
            padding: EdgeInsets.symmetric(horizontal: 68.h, vertical: 35.v),
            decoration: AppDecoration.fillPrimary1
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder22),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 2.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgCreditCard,
                      height: 40.v,
                      width: 50.h),
                  SizedBox(height: 14.v),
                  Text("Credit / Debit Card",
                      style: CustomTextStyles.titleMediumMedium18)
                ])));
  }

  /// Section Widget
  Widget _buildPaymentMethodOne(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 1.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),
              color: theme.colorScheme.primary.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusStyle.roundedBorder14),
              child: Container(
                  height: 109.v,
                  width: 146.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 33.h, vertical: 17.v),
                  decoration: AppDecoration.fillPrimary1.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder14),
                  child: Stack(alignment: Alignment.topCenter, children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 6.v),
                            child: Text("Jazzcash",
                                style: CustomTextStyles.labelLargeMedium13))),
                    CustomImageView(
                        imagePath: ImageConstant.imgJazzcashlogoRemovebgPreview,
                        height: 60.v,
                        width: 80.h,
                        alignment: Alignment.topCenter)
                  ]))),
          CustomElevatedButton(
              height: 109.v,
              width: 146.h,
              text: "Easypaisa",
              rightIcon: Container(
                  margin: EdgeInsets.only(),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgGroup159,
                      height: 25.v,
                      width: 22.h)),
              buttonStyle: CustomButtonStyles.fillPrimaryTL14,
              buttonTextStyle: CustomTextStyles.labelLargeMedium13)
        ]));
  }

  /// Navigates to the paymentMethodTwoScreen when the action is triggered.
  onTapCreditCard(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.paymentMethodTwoScreen);
  }
}
