import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Apka_Furniture/bloc/AuthBloc/auth_cubit.dart';
import 'package:Apka_Furniture/bloc/AuthBloc/auth_sate.dart';
import 'package:Apka_Furniture/core/app_export.dart';
import 'package:Apka_Furniture/presentation/register_screen/register_screen.dart';
import 'package:Apka_Furniture/presentation/seller_home_screen/seller_home_screen.dart';
import 'package:Apka_Furniture/widgets/custom_bottom_app_bar.dart';
import 'package:Apka_Furniture/widgets/custom_elevated_button.dart';
import 'package:Apka_Furniture/widgets/custom_text_form_field.dart';
import 'package:Apka_Furniture/widgets/seller_bottom_bar.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class OtpScreen extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  OtpScreen({Key? key}) : super(key: key);
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              width: mediaQueryData.size.width,
              height: mediaQueryData.size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstant.imgSplashScreen),
                  fit: BoxFit.cover,
                ),
              ),
              child: SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                    Align(
                        alignment: Alignment.center,
                        child: Container(
                            height: 730.v,
                            width: double.maxFinite,
                            margin: EdgeInsets.only(bottom: 53.v),
                            child: Column(children: [
                              _newMethod(),
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 30.h),
                                      child: Text("Enter your OTP",
                                          style: theme.textTheme.bodyLarge!
                                              .copyWith(
                                                  color: appTheme.white)))),
                              _buildSeventeen(context),
                            ])))
                  ])),
            )));
  }

  Align _newMethod() {
    return Align(
        alignment: Alignment.topRight,
        child: SizedBox(
            height: 400.v,
            width: 309.h,
            child: Stack(alignment: Alignment.topLeft, children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 27.h, top: 37.v),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        SizedBox(
                            height: 226.v,
                            width: 200.h,
                            child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                          height: 200.adaptSize,
                                          width: 200.adaptSize,
                                          decoration: BoxDecoration(
                                              color: appTheme.gray200,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      100.h)))),
                                  CustomImageView(
                                      imagePath: ImageConstant.imgGroupCyan300,
                                      height: 187.v,
                                      width: 176.h,
                                      alignment: Alignment.bottomCenter)
                                ])),
                        SizedBox(height: 25.v),
                        Text("Verification",
                            style: theme.textTheme.headlineMedium),
                        SizedBox(height: 2.v),
                        Opacity(
                            opacity: 0.5,
                            child: Text("You will get a OTP via SMS",
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(color: appTheme.white)))
                      ])))
            ])));
  }

  /// Section Widget
  Widget _buildSeventeen(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.h),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                  padding: EdgeInsets.only(top: 10.v),
                  child: CustomTextFormField(
                      width: 300.h,
                      controller: otpController,
                      hintText: "",
                      alignment: Alignment.bottomLeft,
                      borderDecoration: TextFormFieldStyleHelper.fillWhiteA,
                      fillColor: appTheme.white)),
              SizedBox(height: 40.v),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if (state is AuthLoggedInState) {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    String token = state.token;
                    Map<String, dynamic> decodedToken =
                        JwtDecoder.decode(token);
                    if (decodedToken['role'] == 'buyer') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomBottomAppBar(),
                        ),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SellerBottomAppBar(),
                        ),
                      );
                    }

                    //Navigator.pushNamed(context, AppRoutes.sellerHomeScreen);
                  } else if (state is AuthErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(state.error)));
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return Container(
                      height: 50.v,
                      //width: 300.h,
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              theme.colorScheme.primary),
                        ),
                      ),
                    );
                  }
                  return CustomElevatedButton(
                      text: "Verify",
                      height: 50.v,
                      buttonStyle: CustomButtonStyles.fillPrimary,
                      buttonTextStyle: theme.textTheme.titleMedium!
                          .copyWith(color: appTheme.white),
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context)
                            .verifyOTP(otpController.text.toString(), false);
                      });
                },
              ),
              SizedBox(height: 120.v),
              RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Didn’t receive the OTP?",
                        style: theme.textTheme.bodyLarge!
                            .copyWith(color: appTheme.white)),
                    TextSpan(
                        text: " Resend Again",
                        style: theme.textTheme.titleMedium!
                            .copyWith(color: appTheme.white))
                  ]),
                  textAlign: TextAlign.left)
            ])));
  }
}
