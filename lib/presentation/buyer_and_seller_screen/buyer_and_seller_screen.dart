import 'package:frontend/core/app_export.dart';
import 'package:frontend/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class BuyerAndSellerScreen extends StatelessWidget {
  const BuyerAndSellerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstant.imgSplashScreen),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomElevatedButton(
                height: 150.v,
                width: 200.h,
                text: "I’m a Buyer",
                margin: EdgeInsets.only(bottom: 5.v),
                buttonStyle: CustomButtonStyles.fillWhiteA,
                buttonTextStyle:
                    CustomTextStyles.titleSmallPoppinsOnPrimaryContainer,
                onPressed: () {
                  onTapImABuyer(context);
                },
                imagePath:
                    ImageConstant.imgCart, // Replace with the actual image URL
              ),
              SizedBox(height: 45.v),
              CustomElevatedButton(
                height: 150.v,
                width: 200.h,
                text: "I’m a Seller",
                margin: EdgeInsets.only(bottom: 5.v),
                buttonStyle: CustomButtonStyles.fillWhiteA,
                buttonTextStyle:
                    CustomTextStyles.titleSmallPoppinsOnPrimaryContainer,
                onPressed: () {
                  onTapImASeller(context);
                },
                imagePath:
                    ImageConstant.imgUser, // Replace with the actual image URL
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates to the userHomeScreen when the action is triggered.
  onTapImABuyer(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.bottomBarScreen,
    );
  }

  /// Navigates to the registerScreen when the action is triggered.
  onTapImASeller(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.registerScreen);
  }
}
