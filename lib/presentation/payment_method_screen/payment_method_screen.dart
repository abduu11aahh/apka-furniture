import 'package:flutter/material.dart';
import 'package:Apka_Furniture/core/app_export.dart';
import 'package:Apka_Furniture/widgets/custom_elevated_button.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 28.h, top: 213.v, right: 28.h),
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgCheckmark,
                      height: 79.adaptSize,
                      width: 79.adaptSize),
                  SizedBox(height: 17.v),
                  Opacity(
                      opacity: 0.85,
                      child: Text("Thanks for Ordering",
                          style: CustomTextStyles
                              .headlineMediumMontserratOnPrimaryContainer27)),
                  SizedBox(height: 3.v),
                  Opacity(
                      opacity: 0.35,
                      child: Text("Your Order has been Placed",
                          style:
                              CustomTextStyles.bodySmallOnPrimaryContainer12)),
                  SizedBox(height: 43.v),
                  CustomElevatedButton(
                      height: 33.v,
                      width: 155.h,
                      text: "Go to home page",
                      buttonStyle: CustomButtonStyles.outlineOnPrimaryContainer,
                      buttonTextStyle: CustomTextStyles.titleSmallWhiteA700,
                      onPressed: () {
                        onTapGoToHomePage(context);
                      }),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Navigates to the userHomeScreen when the action is triggered.
  onTapGoToHomePage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.userHomeScreen);
  }
}
