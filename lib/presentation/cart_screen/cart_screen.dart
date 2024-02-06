import 'package:flutter/material.dart';
import 'package:frontend/bloc/AuthBloc/auth_cubit.dart';
import 'package:frontend/bloc/QuoteBloc/quote_cubit.dart';
import 'package:frontend/bloc/QuoteBloc/quote_state.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/presentation/cart_screen_one_page/cart_screen_one_page.dart';
import 'package:frontend/presentation/cart_screen_two_page/cart_screen_two_page.dart';
import 'package:frontend/presentation/cart_screen_two_page/widgets/cartscreentwo_quotedItem_widget.dart';
import 'package:frontend/widgets/app_bar/appbar_title.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/bottomBarBloc/bottomBarCubit.dart';
import 'package:frontend/presentation/user_home_screen/user_home_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  CartScreenState createState() => CartScreenState();
}

// ignore_for_file: must_be_immutable
class CartScreenState extends State<CartScreen> with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    // return SafeArea(
    //     child: Scaffold(
    //         appBar: _buildAppBar(context),
    //         body: SingleChildScrollView(
    //             //width: double.maxFinite,
    //             child: Column(children: [
    //           SizedBox(height: 23.v),
    //           _buildTabview(context),
    //           SizedBox(
    //               height: MediaQuery.of(context).size.height,
    //               child: TabBarView(
    //                   controller: tabviewController,
    //                   children: [CartScreenOnePage(), CartScreenTwoPage()]))
    //         ]))));

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
        child: NestedScrollView(
          // physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
              ),
            ];
          },
          body: TabBarView(
            physics: ScrollPhysics(),
            controller: tabviewController,
            children: [CartScreenOnePage(), CartScreenTwoPage()],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.v),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: TabBar(
                controller: tabviewController,
                labelPadding: EdgeInsets.only(bottom: 0.v),
                labelColor:
                    theme.colorScheme.onPrimaryContainer.withOpacity(0.7),
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
                tabs: [
                  Tab(child: Text('Items')),
                  Tab(child: Text('Quoted Items'))
                ]),
          ),
        ),
        leadingWidth: 70.h,
        toolbarHeight: 69.v,
        leading: InkWell(
          onTap: () {
            context.read<BottomBarCubit>().setCurrentTab(0, UserHomeScreen());
          },
          highlightColor: Colors.transparent,
          child: Container(
            margin: EdgeInsets.all(14),
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
        title: AppbarTitle(text: "Cart"),
        actions: [
          Container(
              height: 36.adaptSize,
              width: 36.adaptSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: appTheme.gray, // Change the color as needed
              ),
              margin: EdgeInsets.only(right: 20.h, top: 4.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgOffer,
                  height: 23.adaptSize,
                  width: 23.adaptSize,
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.fromLTRB(8.h, 7.v, 7.h, 8.v)))
        ]);
  }

  /// Section Widget
  // Widget _buildTabview(BuildContext context) {
  //   return Container(
  //       height: 28.v,
  //       width: 311.h,
  //       child: TabBar(
  //           controller: tabviewController,
  //           labelPadding: EdgeInsets.only(bottom: 6.v),
  //           labelColor: theme.colorScheme.onPrimaryContainer.withOpacity(0.7),
  //           labelStyle: TextStyle(
  //               fontSize: 14.fSize,
  //               fontFamily: 'Montserrat',
  //               fontWeight: FontWeight.w600),
  //           unselectedLabelColor:
  //               theme.colorScheme.onPrimaryContainer.withOpacity(0.7),
  //           unselectedLabelStyle: TextStyle(
  //               fontSize: 14.fSize,
  //               fontFamily: 'Montserrat',
  //               fontWeight: FontWeight.w400),
  //           indicatorSize: TabBarIndicatorSize.tab,
  //           indicatorWeight: 5,
  //           dividerColor: appTheme.gray,
  //           dividerHeight: 5.v,
  //           tabs: [
  //             Tab(child: Text('Items')),
  //             Tab(child: Text('Quoted Items'))
  //           ]));
  // }

  /// Navigates to the userHomeScreen when the action is triggered.
  onTapIconButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.userHomeScreen);
  }
}
