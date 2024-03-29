import 'package:flutter/material.dart';
import 'package:Apka_Furniture/core/app_export.dart';
import 'package:Apka_Furniture/widgets/custom_elevated_button.dart';

class PaymentMethodThreeScreen extends StatelessWidget {
  const PaymentMethodThreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 27.v),
                child: Column(children: [
                  Text("Payment", style: theme.textTheme.headlineSmall),
                  Spacer(flex: 53),
                  _buildPaymentMethodThreeDistance(context),
                  Spacer(flex: 46)
                ])),
            bottomNavigationBar: _buildConfirmButton(context)));
  }

  /// Section Widget
  Widget _buildPaymentMethodThreeDistance(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 20.v),
        decoration: AppDecoration.fillBlueGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder22),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 2.h, right: 4.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle24100x98,
                            height: 100.v,
                            width: 98.h,
                            radius: BorderRadius.circular(10.h),
                            margin: EdgeInsets.only(bottom: 70.v)),
                        Padding(
                            padding: EdgeInsets.only(top: 6.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: 179.h,
                                      child: Text(
                                          "Swedish Wood and Linen Bed Grey - 200x120x140 cm",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyles
                                              .labelLargeMedium
                                              .copyWith(height: 1.33))),
                                  SizedBox(height: 4.v),
                                  Opacity(
                                      opacity: 0.25,
                                      child: SizedBox(
                                          width: 177.h,
                                          child: Divider(
                                              color: theme.colorScheme
                                                  .onPrimaryContainer))),
                                  SizedBox(height: 3.v),
                                  Text("Detail",
                                      style: CustomTextStyles
                                          .titleSmallBluegray900),
                                  SizedBox(height: 3.v),
                                  Opacity(
                                      opacity: 0.75,
                                      child: Text("Color : Blue",
                                          style: CustomTextStyles
                                              .labelMediumBluegray900)),
                                  SizedBox(height: 2.v),
                                  Opacity(
                                      opacity: 0.75,
                                      child: Text("Material : Wood",
                                          style: CustomTextStyles
                                              .labelMediumBluegray900)),
                                  SizedBox(height: 3.v),
                                  Opacity(
                                      opacity: 0.75,
                                      child: Text(
                                          "Leg Material : 20 cm Up wood",
                                          style: CustomTextStyles
                                              .labelMediumBluegray900)),
                                  SizedBox(height: 2.v),
                                  Opacity(
                                      opacity: 0.75,
                                      child: Text("Fabric Material : Linen",
                                          style: CustomTextStyles
                                              .labelMediumBluegray900)),
                                  SizedBox(height: 3.v),
                                  Opacity(
                                      opacity: 0.75,
                                      child: Text("Wood : Swedish",
                                          style: CustomTextStyles
                                              .labelMediumBluegray900))
                                ]))
                      ])),
              SizedBox(height: 15.v),
              Align(
                  alignment: Alignment.centerRight,
                  child: Opacity(
                      opacity: 0.5,
                      child: Padding(
                          padding: EdgeInsets.only(right: 78.h),
                          child: Text("Price",
                              style: CustomTextStyles
                                  .bodySmallOnPrimaryContainer)))),
              Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 2.v),
                            child: Text("REMOVE",
                                style: CustomTextStyles.titleSmallRedA700)),
                        Text("23,500/- PKR",
                            style: CustomTextStyles.titleMediumSemiBold_2)
                      ]))
            ]));
  }

  /// Section Widget
  Widget _buildConfirmButton(BuildContext context) {
    return CustomElevatedButton(
        text: "Confirm",
        margin: EdgeInsets.only(left: 30.h, right: 30.h, bottom: 35.v),
        buttonStyle: CustomButtonStyles.fillPrimary,
        buttonTextStyle: CustomTextStyles.titleMediumWhiteA700SemiBold,
        onPressed: () {
          onTapConfirmButton(context);
        });
  }

  /// Navigates to the paymentMethodScreen when the action is triggered.
  onTapConfirmButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.paymentMethodScreen);
  }
}
