import 'package:flutter/material.dart';
import 'package:Apka_Furniture/core/app_export.dart';
import 'package:Apka_Furniture/bloc/bottomBarBloc/sellerBottomBarCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Apka_Furniture/presentation/bidding_screen/bidding_screen.dart';
import 'package:Apka_Furniture/presentation/bidding_screen_seller/bidding_screen.dart';
import 'package:Apka_Furniture/presentation/more_screen/more_screen.dart';
import 'package:Apka_Furniture/presentation/order_screen/order_screen.dart';
import 'package:Apka_Furniture/presentation/seller_home_screen/seller_home_screen.dart';

class SellerBottomAppBar extends StatefulWidget {
  @override
  SellerBottomAppBarState createState() => SellerBottomAppBarState();
}

class SellerBottomAppBarState extends State<SellerBottomAppBar> {
  //int currentTab = 0;
  final List<Widget> screens = [
    SellerHomeScreen(),
    OrderScreen(),
    BiddingScreenSeller(),
    MoreScreen()
  ];
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    SellerBottomBarState sellerBottomBarState =
        context.watch<SellerBottomBarCubit>().state;
    int currentTab = sellerBottomBarState.currentTab;
    Widget currentScreen = sellerBottomBarState.currentScreen;
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.sellerCreatingNewItemScreen);
        },
        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 7,
          color: theme.colorScheme.secondaryContainer,
          surfaceTintColor: Colors.white,
          child: SizedBox(
            height: 61.v,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          context
                              .read<SellerBottomBarCubit>()
                              .setCurrentTab(0, SellerHomeScreen());
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgNavHome,
                            height: 34.adaptSize,
                            width: 34.adaptSize,
                            color: currentTab == 0
                                ? theme.colorScheme.primary
                                : appTheme.gray60001,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.v),
                            child: Text(
                              "Home",
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: currentTab == 0
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.onPrimaryContainer
                                        .withOpacity(0.5),
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      )),
                  InkWell(
                      onTap: () {
                        setState(() {
                          context
                              .read<SellerBottomBarCubit>()
                              .setCurrentTab(1, OrderScreen());
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgNavOrders,
                            height: 34.adaptSize,
                            width: 34.adaptSize,
                            color: currentTab == 1
                                ? theme.colorScheme.primary
                                : appTheme.gray60001,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.v),
                            child: Text(
                              "Orders",
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: currentTab == 1
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.onPrimaryContainer
                                        .withOpacity(0.5),
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 5.v),
                    child: Text(
                      "Add Items",
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer
                            .withOpacity(0.5),
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          context
                              .read<SellerBottomBarCubit>()
                              .setCurrentTab(2, BiddingScreenSeller());
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgNavProposal,
                            height: 34.adaptSize,
                            width: 34.adaptSize,
                            color: currentTab == 2
                                ? theme.colorScheme.primary
                                : appTheme.gray60001,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.v),
                            child: Text(
                              "Proposal",
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: currentTab == 2
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.onPrimaryContainer
                                        .withOpacity(0.5),
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      )),
                  InkWell(
                      onTap: () {
                        setState(() {
                          context
                              .read<SellerBottomBarCubit>()
                              .setCurrentTab(3, MoreScreen());
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgNavMore,
                            height: 34.adaptSize,
                            width: 34.adaptSize,
                            color: currentTab == 3
                                ? theme.colorScheme.primary
                                : appTheme.gray60001,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.v),
                            child: Text(
                              "More",
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: currentTab == 3
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.onPrimaryContainer
                                        .withOpacity(0.5),
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      )),
                ]),
          ),
        ),
      ),
    );
  }
}
