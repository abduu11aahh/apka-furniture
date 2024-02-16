import 'package:flutter/material.dart';
import 'package:Apka_Furniture/bloc/AuthBloc/auth_cubit.dart';
import 'package:Apka_Furniture/bloc/QuoteBloc/quote_cubit.dart';
import 'package:Apka_Furniture/bloc/bottomBarBloc/sellerBottomBarCubit.dart';
import 'package:Apka_Furniture/core/app_export.dart';
import 'package:Apka_Furniture/presentation/order_screen_five_page/order_screen_five_page.dart';
import 'package:Apka_Furniture/presentation/order_screen_four_page/order_screen_four_page.dart';
//import 'package:Apka_Furniture/presentation/notification_screen_one_page/notification_screen_one_page.dart';
import 'package:Apka_Furniture/presentation/order_screen_one_page/order_screen_one_page.dart';
import 'package:Apka_Furniture/presentation/order_screen_three_page/order_screen_three_page.dart';
import 'package:Apka_Furniture/presentation/order_screen_two_page/order_screen_two_page.dart';
import 'package:Apka_Furniture/presentation/seller_home_screen/seller_home_screen.dart';
import 'package:Apka_Furniture/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:Apka_Furniture/widgets/app_bar/appbar_title.dart';
import 'package:Apka_Furniture/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Apka_Furniture/bloc/bottomBarBloc/bottomBarCubit.dart';
//import 'package:Apka_Furniture/widgets/custom_bottom_app_bar.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  OrderScreenState createState() => OrderScreenState();
}

// ignore_for_file: must_be_immutable
class OrderScreenState extends State<OrderScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 5, vsync: this);
    tabviewController.addListener(() {
      String token = context.read<AuthCubit>().getToken();
      // if (tabviewController.index == 0) {
      //   context.read<QuoteCubit>().getQuotesByCategory('Bed', token);
      // } else if (tabviewController.index == 1) {
      //   context.read<QuoteCubit>().getQuotesByCategory('Sofa', token);
      // } else if (tabviewController.index == 2) {
      //   context.read<QuoteCubit>().getQuotesByCategory('Table', token);
      // } else if (tabviewController.index == 3) {
      //   context.read<QuoteCubit>().getQuotesByCategory('Chair', token);
      // } else if (tabviewController.index == 4) {
      //   context.read<QuoteCubit>().getQuotesByCategory('Others', token);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 28.v),
                  _buildTabview(context),
                  Expanded(
                      child: SizedBox(
                          height: 560.v,
                          child: TabBarView(
                              controller: tabviewController,
                              children: [
                                OrderScreenOnePage(),
                                OrderScreenTwoPage(),
                                OrderScreenThreePage(),
                                OrderScreenFourPage(),
                                OrderScreenFivePage(),
                              ])))
                ])),
            // bottomNavigationBar: _buildBottomAppBar(context),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: 70.h,
      toolbarHeight: 65.v,
      leading: InkWell(
        onTap: () {
          context
              .read<SellerBottomBarCubit>()
              .setCurrentTab(0, SellerHomeScreen());
        },
        highlightColor: Colors.transparent,
        child: Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: appTheme.gray, // Change the color as needed
          ),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20.0,
          ),
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(text: "Orders"),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    String token = context.read<AuthCubit>().getToken();
    return Container(
        height: 28.v,
        width: 311.h,
        child: TabBar(
            controller: tabviewController,
            labelPadding: EdgeInsets.only(bottom: 6.v),
            labelColor: theme.colorScheme.onPrimaryContainer.withOpacity(0.7),
            labelStyle: TextStyle(
                fontSize: 14.fSize,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600),
            unselectedLabelColor:
                theme.colorScheme.onPrimaryContainer.withOpacity(0.7),
            unselectedLabelStyle: TextStyle(
                fontSize: 14.fSize,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 5,
            dividerColor: appTheme.gray,
            dividerHeight: 5.v,
            onTap: (index) {
              if (index == 0) {
                //   context.read<QuoteCubit>().getQuotesByCategory('Bed', token);
                // } else if (index == 1) {
                //   context.read<QuoteCubit>().getQuotesByCategory('Sofa', token);
                // } else if (index == 2) {
                //   context.read<QuoteCubit>().getQuotesByCategory('Table', token);
                // } else if (index == 3) {
                //   context.read<QuoteCubit>().getQuotesByCategory('Chair', token);
                // } else if (index == 4) {
                //   context.read<QuoteCubit>().getQuotesByCategory('Others', token);
              }
            },
            tabs: [
              Tab(child: Text('Bed')),
              Tab(child: Text('Sofa')),
              Tab(child: Text('Table')),
              Tab(child: Text('Chair')),
              Tab(child: Text('Others'))
            ]));
  }

  /// Navigates to the sellerHomeScreen when the action is triggered.
  onTapIconButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.sellerHomeScreen);
  }
}
