import 'package:flutter/material.dart';
import 'package:Apka_Furniture/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "splash screen pre loader",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.splashScreenPreLoaderScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Splash screen One",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.splashScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Splash screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.splashScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Info Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.infoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "buyer and seller screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.buyerAndSellerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Register One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.registerOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Register-Two",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.otpScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Register",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.registerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Register-Two One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.registerTwoOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Login",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Notification Screen One - Container",
                          onTapScreenTitle: () => onTapScreenTitle(context,
                              AppRoutes.notificationScreenOneContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "User Home Screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.userHomeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Item Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.itemScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Buyer Creating new item Screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.buyerCreatingNewItemScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Order Screen One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.orderScreenOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Cart Screen One - Tab Container",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.cartScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Bidding Screen Two - Tab Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.biddingScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "More Screen One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.moreScreenOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Payment Method One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.paymentMethodOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Payment Method Two",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.paymentMethodTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Payment Method Three",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.paymentMethodThreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Payment Method",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.paymentMethodScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Notification Screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.notificationScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Seller Home Screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.sellerHomeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Seller Creating new item Screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.sellerCreatingNewItemScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Order Screen - Tab Container",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.orderScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Bidding Screen - Tab Container",
                          onTapScreenTitle: () => onTapScreenTitle(context,
                              AppRoutes.biddingScreenTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "More Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.moreScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}
