import 'package:flutter/material.dart';
import 'package:frontend/bloc/AuthBloc/auth_cubit.dart';
import 'package:frontend/bloc/AuthBloc/auth_sate.dart';
import 'package:frontend/bloc/bottomBarBloc/sellerBottomBarCubit.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/presentation/buyer_and_seller_screen/buyer_and_seller_screen.dart';
import 'package:frontend/presentation/seller_home_screen/seller_home_screen.dart';
//import 'package:frontend/presentation/notification_screen_one_page/notification_screen_one_page.dart';
import 'package:frontend/widgets/app_bar/appbar_title.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/bottomBarBloc/bottomBarCubit.dart';
import 'package:frontend/presentation/user_home_screen/user_home_screen.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

// ignore_for_file: must_be_immutable
class MoreScreen extends StatelessWidget {
  MoreScreen({Key? key}) : super(key: key);

  TextEditingController userController = TextEditingController();

  TextEditingController vectorController = TextEditingController();

  TextEditingController vectorController1 = TextEditingController();

  TextEditingController vectorController2 = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    String token = context.read<AuthCubit>().getToken();
    String name = 'Buyer';
    if (token != '') {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      name = decodedToken['name'];
    }
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 16.v),
          child: Column(children: [
            Container(
                height: 109.adaptSize,
                width: 109.adaptSize,
                padding: EdgeInsets.all(4.h),
                decoration: AppDecoration.fillPrimary
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder54),
                child: CustomImageView(
                    imagePath: ImageConstant.imgEllipse21,
                    height: 101.adaptSize,
                    width: 101.adaptSize,
                    radius: BorderRadius.circular(50.h),
                    alignment: Alignment.center)),
            SizedBox(height: 8.v),
            Text("$name", style: CustomTextStyles.headlineSmallSemiBold),
            SizedBox(height: 26.v),
            _buildUser(context),
            SizedBox(height: 12.v),
            _buildVector(context),
            SizedBox(height: 12.v),
            _buildThirtyNine(context),
            SizedBox(height: 12.v),
            _buildVector1(context),
            SizedBox(height: 12.v),
            _buildVector2(context),
            SizedBox(height: 12.v),
            _buildFortyTwo(context),
            SizedBox(height: 12.v),
            _buildFortyThree(context),
            SizedBox(height: 15.v)
          ])),
      // bottomNavigationBar: _buildFortySix(context),
      // bottomNavigationBar: CustomBottomAppBar(parentContext: context),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushNamed(
      //         context, AppRoutes.buyerCreatingNewItemScreen);
      //   },
      //   shape: CircleBorder(),
      //   child: Icon(Icons.add, color: Colors.white),
      // ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.centerDocked
    ));
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
        title: AppbarTitle(text: "More"),
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
  Widget _buildUser(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 13.v),
        decoration: AppDecoration.fillGray200
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
        child: Row(children: [
          CustomImageView(
              imagePath: ImageConstant.imgUserBlueGray900,
              height: 15.adaptSize,
              width: 15.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 1.v)),
          Opacity(
              opacity: 0.75,
              child: Padding(
                  padding: EdgeInsets.only(left: 7.h),
                  child: Text("Profile Setting",
                      style: theme.textTheme.titleSmall)))
        ]));
  }

  /// Section Widget
  Widget _buildVector(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 13.v),
        decoration: AppDecoration.fillGray200
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
        child: Row(children: [
          CustomImageView(
              imagePath: ImageConstant.imgVectorBlueGray90014x19,
              height: 15.adaptSize,
              width: 15.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 1.v)),
          Opacity(
              opacity: 0.75,
              child: Padding(
                  padding: EdgeInsets.only(left: 7.h),
                  child: Text("Payments", style: theme.textTheme.titleSmall)))
        ]));
  }

  /// Section Widget
  Widget _buildThirtyNine(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 11.v),
        decoration: AppDecoration.fillGray200
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
        child: Row(children: [
          CustomImageView(
              imagePath: ImageConstant.imgWpfFaq,
              height: 20.adaptSize,
              width: 20.adaptSize,
              margin: EdgeInsets.only(top: 3.v)),
          Opacity(
              opacity: 0.75,
              child: Padding(
                  padding: EdgeInsets.only(left: 9.h, top: 3.v),
                  child: Text("FAQs", style: theme.textTheme.titleSmall)))
        ]));
  }

  /// Section Widget
  Widget _buildVector1(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 13.v),
        decoration: AppDecoration.fillGray200
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
        child: Row(children: [
          CustomImageView(
              imagePath: ImageConstant.imgVectorBlueGray90015x16,
              height: 15.adaptSize,
              width: 15.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 1.v)),
          Opacity(
              opacity: 0.75,
              child: Padding(
                  padding: EdgeInsets.only(left: 7.h),
                  child: Text("Rate us", style: theme.textTheme.titleSmall)))
        ]));
  }

  /// Section Widget
  Widget _buildVector2(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 13.v),
        decoration: AppDecoration.fillGray200
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
        child: Row(children: [
          CustomImageView(
              imagePath: ImageConstant.imgVectorBlueGray90015x15,
              height: 15.adaptSize,
              width: 15.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 1.v)),
          Opacity(
              opacity: 0.75,
              child: Padding(
                  padding: EdgeInsets.only(left: 7.h),
                  child:
                      Text("Live Support", style: theme.textTheme.titleSmall)))
        ]));
  }

  /// Section Widget
  Widget _buildFortyTwo(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 13.v),
        decoration: AppDecoration.fillGray200
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
        child: Row(children: [
          CustomImageView(
              imagePath: ImageConstant.imgInfo,
              height: 15.adaptSize,
              width: 15.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 1.v)),
          Opacity(
              opacity: 0.75,
              child: Padding(
                  padding: EdgeInsets.only(left: 7.h),
                  child: Text("About us", style: theme.textTheme.titleSmall)))
        ]));
  }

  /// Section Widget
  Widget _buildFortyThree(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoggedOutState) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BuyerAndSellerScreen(),
            ),
          );
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            BlocProvider.of<AuthCubit>(context).logOut();
          },
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 11.v),
              decoration: AppDecoration.fillGray200
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
              child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgVectorBlueGray90013x16,
                    height: 13.v,
                    width: 16.h,
                    margin: EdgeInsets.only(top: 5.v, bottom: 2.v)),
                Opacity(
                    opacity: 0.75,
                    child: Padding(
                        padding: EdgeInsets.only(left: 7.h, top: 3.v),
                        child:
                            Text("Log Out", style: theme.textTheme.titleSmall)))
              ])),
        );
      },
    );
  }

  /// Navigates to the sellerHomeScreen when the action is triggered.
  onTapIconButton(BuildContext context) {
    context.read<BottomBarCubit>().setCurrentTab(0, UserHomeScreen());
    context.read<SellerBottomBarCubit>().setCurrentTab(0, SellerHomeScreen());
  }
}
