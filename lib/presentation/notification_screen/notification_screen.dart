import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/NotificationBloc/notification_cubit.dart';
import 'package:frontend/bloc/NotificationBloc/notification_state.dart';

import '../notification_screen/widgets/notification_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
//import 'package:frontend/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:frontend/widgets/app_bar/appbar_title.dart';
//import 'package:frontend/widgets/app_bar/custom_app_bar.dart';
import 'package:frontend/widgets/custom_bottom_app_bar.dart';
//import 'package:frontend/widgets/custom_icon_button.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Column(children: [
              SizedBox(height: 17.v),
              _buildNotification(context),
              SizedBox(height: 10.v),
              //_buildDescription(context)
            ])),
      ),
    ));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
        surfaceTintColor: Colors.white,
        leadingWidth: 70.h,
        toolbarHeight: 65.v,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
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
              size: 22.0,
            ),
          ),
        ),
        centerTitle: true,
        title: AppbarTitle(text: "Notifications"));
  }

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Section Widget
  Widget _buildNotification(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        if (state.messages.length == 0) {
          return Text('You do not have any notifications!');
        }
        return Padding(
            padding: EdgeInsets.only(right: 1.h),
            child: ListView.separated(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10.v);
                },
                itemCount: state.messages.length,
                itemBuilder: (context, index) {
                  return NotificationscreenItemWidget(
                      notification: state.messages[index]);
                }));
      },
    );
  }

  // /// Section Widget
  // Widget _buildDescription(BuildContext context) {
  //   return Container(
  //       margin: EdgeInsets.only(right: 1.h, bottom: 30.v),
  //       padding:
  //           EdgeInsets.only(left: 18.h, right: 18.h, top: 9.v, bottom: 9.v),
  //       decoration: BoxDecoration(
  //           color: theme.colorScheme.primary,
  //           borderRadius: BorderRadius.circular(
  //             10.h,
  //           )),
  //       child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             SizedBox(height: 2.v),
  //             CustomImageView(
  //                 imagePath: ImageConstant.imgRectangle9,
  //                 height: 193.v,
  //                 width: 273.h,
  //                 radius: BorderRadius.circular(7.h)),
  //             SizedBox(height: 10.v),
  //             Align(
  //                 alignment: Alignment.centerLeft,
  //                 child: Container(
  //                     width: 240.h,
  //                     margin: EdgeInsets.only(right: 35.h),
  //                     child: Text(
  //                         "Introducing Our Latest Sofa Collection:\nComfort Redefined",
  //                         maxLines: 2,
  //                         overflow: TextOverflow.ellipsis,
  //                         style: theme.textTheme.labelLarge!
  //                             .copyWith(height: 1.50)))),
  //             SizedBox(height: 16.v),
  //             Opacity(
  //                 opacity: 0.75,
  //                 child: SizedBox(
  //                     width: 270.h,
  //                     child: Text(
  //                         "Don't miss the chance to upgrade your comfort level! Visit our online inventory to explore the latest sofa collection. Indulge in luxury, unwind in style, and transform your space with our exquisite sofas!",
  //                         maxLines: 3,
  //                         overflow: TextOverflow.ellipsis,
  //                         style: CustomTextStyles.montserratBluegray900Medium
  //                             .copyWith(height: 1.60))))
  //           ]));
  // }

  /// Navigates to the userHomeScreen when the action is triggered.
//   onTapIconButton(BuildContext context) {
//     Navigator.pushNamed(context, AppRoutes.userHomeScreen);
//   }
}
