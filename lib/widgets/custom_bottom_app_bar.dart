import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/bloc/bottomBarBloc/bottomBarCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/presentation/bidding_screen/bidding_screen.dart';
import 'package:frontend/presentation/cart_screen/cart_screen.dart';
import 'package:frontend/presentation/more_screen/more_screen.dart';
import 'package:frontend/presentation/user_home_screen/user_home_screen.dart';

class CustomBottomAppBar extends StatefulWidget {
  @override
  CustomBottomAppBarState createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  //int currentTab = 0;
  final List<Widget> screens = [
    UserHomeScreen(),
    CartScreen(),
    BiddingScreen(),
    MoreScreen()
  ];
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    BottomBarState bottomBarState = context.watch<BottomBarCubit>().state;
    int currentTab = bottomBarState.currentTab;
    Widget currentScreen = bottomBarState.currentScreen;
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.buyerCreatingNewItemScreen);
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
                              .read<BottomBarCubit>()
                              .setCurrentTab(0, UserHomeScreen());
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
                              .read<BottomBarCubit>()
                              .setCurrentTab(1, CartScreen());
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgNavCart,
                            height: 34.adaptSize,
                            width: 34.adaptSize,
                            color: currentTab == 1
                                ? theme.colorScheme.primary
                                : appTheme.gray60001,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.v),
                            child: Text(
                              "Cart",
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
                      "Upload Samples",
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
                              .read<BottomBarCubit>()
                              .setCurrentTab(2, BiddingScreen());
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
                              .read<BottomBarCubit>()
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
