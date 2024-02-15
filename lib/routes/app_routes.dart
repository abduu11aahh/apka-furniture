import 'package:flutter/material.dart';
//import 'package:Apka_Furniture/presentation/splash_screen_pre_loader_screen/splash_screen_pre_loader_screen.dart';
import 'package:Apka_Furniture/presentation/splash_screen/splash_screen.dart';
import 'package:Apka_Furniture/presentation/splash_logo_screen/splash_logo_screen.dart';
import 'package:Apka_Furniture/presentation/info_screen/info_screen.dart';
import 'package:Apka_Furniture/presentation/buyer_and_seller_screen/buyer_and_seller_screen.dart';
//import 'package:Apka_Furniture/presentation/register_one_screen/register_one_screen.dart';
import 'package:Apka_Furniture/presentation/otp_screen/otp_screen.dart';
import 'package:Apka_Furniture/presentation/register_screen/register_screen.dart';
//import 'package:Apka_Furniture/presentation/otp_screen/otp_screen.dart';
import 'package:Apka_Furniture/presentation/login_screen/login_screen.dart';
//import 'package:Apka_Furniture/presentation/notification_screen_one_container_screen/notification_screen_one_container_screen.dart';
//import 'package:Apka_Furniture/presentation/notification_screen/notification_screen.dart';
import 'package:Apka_Furniture/presentation/user_home_screen/user_home_screen.dart';
import 'package:Apka_Furniture/presentation/item_screen/item_screen.dart';
import 'package:Apka_Furniture/presentation/buyer_creating_new_item_screen/buyer_creating_new_item_screen.dart';
import 'package:Apka_Furniture/presentation/blur_buyer_creating_new_item_screen/blur_buyer_creating_new_item_screen.dart';
//import 'package:Apka_Furniture/presentation/order_screen_one_screen/order_screen_one_screen.dart';
import 'package:Apka_Furniture/presentation/cart_screen/cart_screen.dart';
//import 'package:Apka_Furniture/presentation/bidding_screen_two_tab_container_screen/bidding_screen_two_tab_container_screen.dart';
//import 'package:Apka_Furniture/presentation/more_screen_one_screen/more_screen_one_screen.dart';
import 'package:Apka_Furniture/presentation/payment_method_one_screen/payment_method_one_screen.dart';
import 'package:Apka_Furniture/presentation/payment_method_two_screen/payment_method_two_screen.dart';
import 'package:Apka_Furniture/presentation/payment_method_three_screen/payment_method_three_screen.dart';
import 'package:Apka_Furniture/presentation/payment_method_screen/payment_method_screen.dart';

import 'package:Apka_Furniture/presentation/notification_screen/notification_screen.dart';

import 'package:Apka_Furniture/presentation/seller_home_screen/seller_home_screen.dart';
import 'package:Apka_Furniture/presentation/seller_creating_new_item_screen/seller_creating_new_item_screen.dart';
import 'package:Apka_Furniture/presentation/order_screen/order_screen.dart';
import 'package:Apka_Furniture/presentation/bidding_screen/bidding_screen.dart';
import 'package:Apka_Furniture/presentation/more_screen/more_screen.dart';
import 'package:Apka_Furniture/presentation/app_navigation_screen/app_navigation_screen.dart';

import 'package:Apka_Furniture/widgets/custom_bottom_app_bar.dart';
import 'package:Apka_Furniture/widgets/seller_bottom_bar.dart';

class AppRoutes {
  static const String splashScreenPreLoaderScreen =
      '/splash_screen_pre_loader_screen';
  static const String bottomBarScreen = '/bottom_bar_screen';
  static const String sellerbottomBarScreen = '/seller_bottom_bar_screen';
  static const String splashScreen = '/splash_screen';

  static const String splashLogoScreen = '/splash_logo_screen';

  static const String infoScreen = '/info_screen';

  static const String buyerAndSellerScreen = '/buyer_and_seller_screen';

  static const String registerOneScreen = '/register_one_screen';

  static const String otpScreen = '/otp_screen';

  static const String registerScreen = '/register_screen';

  static const String registerTwoOneScreen = '/register_two_one_screen';

  static const String loginScreen = '/login_screen';

  static const String notificationScreenOnePage =
      '/notification_screen_one_page';

  static const String notificationScreenOneContainerScreen =
      '/notification_screen_one_container_screen';

  static const String userHomeScreen = '/user_home_screen';

  static const String itemScreen = '/item_screen';

  static const String buyerCreatingNewItemScreen =
      '/buyer_creating_new_item_screen';

  static const String blurBuyerCreatingNewItemScreen =
      '/blur_buyer_creating_new_item_screen';

  static const String orderScreenOneScreen = '/order_screen_one_screen';

  static const String cartScreenOnePage = '/cart_screen_one_page';

  static const String cartScreen = '/cart_screen_one_tab_container_screen';

  static const String cartScreenTwoPage = '/cart_screen_two_page';

  static const String biddingScreenThreePage = '/bidding_screen_three_page';

  static const String biddingScreenTwoPage = '/bidding_screen_two_page';

  static const String biddingScreen = '/bidding_screen';

  static const String moreScreenOneScreen = '/more_screen_one_screen';

  static const String paymentMethodOneScreen = '/payment_method_one_screen';

  static const String paymentMethodTwoScreen = '/payment_method_two_screen';

  static const String paymentMethodThreeScreen = '/payment_method_three_screen';

  static const String paymentMethodScreen = '/payment_method_screen';

  static const String notificationScreen = '/notification_screen';

  static const String sellerHomeScreen = '/seller_home_screen';

  static const String sellerCreatingNewItemScreen =
      '/seller_creating_new_item_screen';

  static const String orderScreenOnePage = '/order_screen_one__page';

  static const String orderScreen = '/order_screen';

  //static const String orderScreenFourPage = '/order_screen_four_page';

  //static const String orderScreenThreePage = '/order_screen_three_page';

  static const String biddingScreenOnePage = '/bidding_screen_one_page';

  static const String biddingScreenPage = '/bidding_screen_page';

  static const String biddingScreenTabContainerScreen =
      '/bidding_screen_tab_container_screen';

  static const String moreScreen = '/more_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    //splashScreenPreLoaderScreen: (context) => SplashScreenPreLoaderScreen(),
    splashScreen: (context) => SplashScreen(),
    bottomBarScreen: (context) => CustomBottomAppBar(),
    sellerbottomBarScreen: (context) => SellerBottomAppBar(),
    splashLogoScreen: (context) => SplashLogoScreen(),
    infoScreen: (context) => InfoScreen(),
    buyerAndSellerScreen: (context) => BuyerAndSellerScreen(),
    //registerOneScreen: (context) => RegisterOneScreen(),
    otpScreen: (context) => OtpScreen(),
    registerScreen: (context) => RegisterScreen(),
    //registerTwoOneScreen: (context) => RegisterTwoOneScreen(),
    loginScreen: (context) => LoginScreen(),
    //notificationScreenOneContainerScreen: (context) =>
    //  NotificationScreenOneContainerScreen(),
    userHomeScreen: (context) => UserHomeScreen(),
    itemScreen: (context) => ItemScreen(),
    buyerCreatingNewItemScreen: (context) => BuyerCreatingNewItemScreen(),
    blurBuyerCreatingNewItemScreen: (context) =>
        BlurBuyerCreatingNewItemScreen(),
    // orderScreenOnePage: (context) => OrderScreenOnePage(),
    cartScreen: (context) => CartScreen(),
    // biddingScreenTwoTabContainerScreen: (context) =>
    //     BiddingScreenTwoTabContainerScreen(),
    // moreScreenOneScreen: (context) => MoreScreenOneScreen(),
    paymentMethodOneScreen: (context) => PaymentMethodOneScreen(),
    paymentMethodTwoScreen: (context) => PaymentMethodTwoScreen(),
    paymentMethodThreeScreen: (context) => PaymentMethodThreeScreen(),
    paymentMethodScreen: (context) => PaymentMethodScreen(),
    notificationScreen: (context) => NotificationScreen(),
    sellerHomeScreen: (context) => SellerHomeScreen(),
    sellerCreatingNewItemScreen: (context) => SellerCreatingNewItemScreen(),
    /////////
    orderScreen: (context) => OrderScreen(),
    /////////
    biddingScreen: (context) => BiddingScreen(),
    moreScreen: (context) => MoreScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
