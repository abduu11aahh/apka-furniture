import 'package:flutter/material.dart';
import 'package:Apka_Furniture/bloc/bottomBarBloc/sellerBottomBarCubit.dart';
import 'package:Apka_Furniture/core/app_export.dart';
import 'package:Apka_Furniture/presentation/bidding_screen_one_page/bidding_screen_one_page.dart';
import 'package:Apka_Furniture/presentation/bidding_screen_two_page/bidding_screen_two_page.dart';
import 'package:Apka_Furniture/presentation/seller_home_screen/seller_home_screen.dart';
import 'package:Apka_Furniture/presentation/user_home_screen/user_home_screen.dart';
import 'package:Apka_Furniture/widgets/app_bar/appbar_title.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Apka_Furniture/bloc/bottomBarBloc/bottomBarCubit.dart';
import 'package:Apka_Furniture/widgets/custom_bottom_app_bar.dart';
import 'package:Apka_Furniture/widgets/custom_bottom_app_bar.dart';

class BiddingScreen extends StatefulWidget {
  const BiddingScreen({Key? key}) : super(key: key);

  @override
  CartScreenState createState() => CartScreenState();
}

// ignore_for_file: must_be_immutable
class CartScreenState extends State<BiddingScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 23.v),
            _buildTabview(context),
            SizedBox(
                height: 648.v,
                child: TabBarView(controller: tabviewController, children: [
                  BiddingScreenOnePage(),
                  BiddingScreenTwoPage()
                ])),
            SizedBox(height: 23.v),
          ]),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
        leadingWidth: 70.h,
        toolbarHeight: 65.v,
        leading: InkWell(
          onTap: () {
            context.read<BottomBarCubit>().setCurrentTab(0, UserHomeScreen());
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
        title: AppbarTitle(text: "Proposal"),
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
  Widget _buildTabview(BuildContext context) {
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
            tabs: [
              Tab(child: Text('Invites')),
              Tab(child: Text('Confirm Orders'))
            ]));
  }

  /// Navigates to the userHomeScreen when the action is triggered.
  onTapIconButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.userHomeScreen);
  }
}
