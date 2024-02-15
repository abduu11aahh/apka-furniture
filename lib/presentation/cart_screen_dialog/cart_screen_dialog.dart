import 'package:flutter/material.dart';
import 'package:Apka_Furniture/core/app_export.dart';
import 'package:Apka_Furniture/widgets/custom_elevated_button.dart';

class CartScreenDialog extends StatelessWidget {
  const CartScreenDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
        width: 311.h,
        padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 20.v),
        decoration: BoxDecoration(
            color: appTheme.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 10.v),
              CustomImageView(
                  imagePath: ImageConstant.imgCloseDeepOrange,
                  height: 60.adaptSize,
                  width: 60.adaptSize,
                  onTap: () {
                    onTapImgClose(context);
                  }),
              SizedBox(height: 12.v),
              Container(
                  width: 256.h,
                  margin: EdgeInsets.only(left: 9.h),
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Please Register ",
                            style: theme.textTheme.titleMedium),
                        TextSpan(
                            text: "to Continue\nyour Order...!!!",
                            style: theme.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                            ))
                      ]),
                      textAlign: TextAlign.center)),
              SizedBox(height: 30.v),
              GestureDetector(
                  onTap: () {
                    onTapRegisterNow(context);
                  },
                  child: Text("Register Now",
                      style: theme.textTheme.titleMedium!.copyWith(
                          color: appTheme.red,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              appTheme.red, // Change the underline color
                          decorationThickness: 3.0)))
            ]));
  }

  /// Navigates back to the previous screen.
  onTapImgClose(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the registerOneScreen when the action is triggered.
  onTapRegisterNow(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.registerScreen, arguments: true);
  }
}
