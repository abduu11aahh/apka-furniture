import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFF3F4F7),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 42.h,
            right: 42.h,
            bottom: 89.v,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 68.v),
              Container(
                height: 242.adaptSize,
                width: 242.adaptSize,
                padding: EdgeInsets.symmetric(
                  horizontal: 7.h,
                  vertical: 13.v,
                ),
                decoration: AppDecoration.fillCyan.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder121,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgGroupOnprimarycontainer,
                  height: 198.v,
                  width: 215.h,
                  alignment: Alignment.topLeft,
                ),
              ),
              SizedBox(height: 55.v),
              Container(
                width: 300.h,
                margin: EdgeInsets.only(
                  left: 0.h,
                  right: 0.h,
                ),
                child: Text(
                  "Unique Furniture to Decor \nYour Home",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.titleLargePoppins.copyWith(
                    height: 1.10,
                  ),
                ),
              ),
              SizedBox(height: 16.v),
              Opacity(
                opacity: 0.5,
                child: SizedBox(
                  width: 273.h,
                  child: Text(
                    "Apka Furniture streamlines discovering and selecting distinct pieces to elevate your home",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodySmallPoppinsOnPrimaryContainer,
                  ),
                ),
              ),
              SizedBox(height: 53.v),
              // SizedBox(
              //   height: 8.v,
              //   child: AnimatedSmoothIndicator(
              //     activeIndex: 0,
              //     count: 3,
              //     effect: ScrollingDotsEffect(
              //       spacing: 6,
              //       activeDotColor: appTheme.gray600,
              //       dotColor: appTheme.blueGray100,
              //       dotHeight: 8.v,
              //       dotWidth: 8.h,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        bottomNavigationBar: _buildGetStartedButton(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildGetStartedButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Get Started",
      margin: EdgeInsets.only(
        left: 30.h,
        right: 30.h,
        bottom: 42.v,
      ),
      buttonStyle: CustomButtonStyles.fillPrimary,
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.buyerAndSellerScreen);
      },
    );
  }
}
