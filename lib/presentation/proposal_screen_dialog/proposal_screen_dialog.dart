import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/widgets/custom_elevated_button.dart';

class ProposalScreenDialog extends StatelessWidget {
  const ProposalScreenDialog({Key? key}) : super(key: key);

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
              SizedBox(height: 12.v),
              Container(
                  width: 256.h,
                  margin: EdgeInsets.only(left: 9.h),
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Please Hold! ",
                            style: theme.textTheme.titleMedium),
                        TextSpan(
                            text: "We are contacting you...!!!",
                            style: theme.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                            ))
                      ]),
                      textAlign: TextAlign.center)),
              SizedBox(height: 30.v),
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
