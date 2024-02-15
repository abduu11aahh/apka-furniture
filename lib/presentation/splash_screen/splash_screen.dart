import 'package:flutter/material.dart';
import 'package:Apka_Furniture/core/app_export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.splashLogoScreen);
    });

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          decoration: BoxDecoration(
            //color: appTheme.whiteA700,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgSplashScreen,
              ),
              fit: BoxFit.cover,
            ),
          ),
          // child: SizedBox(
          //   width: double.maxFinite,
          //   child: CustomImageView(
          //     imagePath: ImageConstant.imgGroup,
          //     height: 7.adaptSize,
          //     width: 7.adaptSize,
          //     alignment: Alignment.center,
          //   ),
          // ),
        ),
      ),
    );
  }
}
