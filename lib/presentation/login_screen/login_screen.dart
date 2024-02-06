import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/AuthBloc/auth_cubit.dart';
import 'package:frontend/bloc/AuthBloc/auth_sate.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/widgets/custom_bottom_app_bar.dart';
import 'package:frontend/widgets/custom_elevated_button.dart';
import 'package:frontend/widgets/custom_text_form_field.dart';
import 'package:frontend/widgets/seller_bottom_bar.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController enteryourOTPController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstant.imgSplashScreen),
                fit: BoxFit.cover,
              ),
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 30.h,
                  vertical: 2.v,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 100.v),
                    Container(
                        child: CustomImageView(
                      imagePath: ImageConstant.imgGroupWhiteA700150x149,
                      alignment: Alignment.center,
                    )),
                    SizedBox(height: 100.v),
                    CustomTextFormField(
                      controller: phoneNumberController,
                      hintText: "Phone Number",
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !RegExp(r'^\+92\d{10}$').hasMatch(value)) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                      hintStyle: theme.textTheme.bodyLarge!.copyWith(
                        color: theme.colorScheme.onPrimaryContainer
                            .withOpacity(0.4),
                      ),
                      textInputType: TextInputType.phone,
                      borderDecoration: TextFormFieldStyleHelper.fillWhiteA,
                      fillColor: appTheme.white,
                    ),
                    SizedBox(height: 4.v),
                    Align(
                      alignment: Alignment.centerRight,
                      child: BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is AuthCodeSentState) {
                            return null;
                          }
                        },
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                BlocProvider.of<AuthCubit>(context)
                                    .sendOTPLogin(phoneNumberController.text);
                              }
                            },
                            child: Text(
                              "Resend OTP",
                              style: theme.textTheme.labelMedium!
                                  .copyWith(color: appTheme.white),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 8.v),
                    CustomTextFormField(
                      controller: enteryourOTPController,
                      hintText: "Enter your OTP",
                      hintStyle: theme.textTheme.bodyLarge!.copyWith(
                        color: theme.colorScheme.onPrimaryContainer
                            .withOpacity(0.4),
                      ),
                      textInputAction: TextInputAction.done,
                      borderDecoration: TextFormFieldStyleHelper.fillWhiteA,
                      fillColor: appTheme.white,
                    ),
                    SizedBox(height: 37.v),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
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
                        // TODO: implement listener
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
                            text: "Login",
                            height: 50.v,
                            buttonStyle: CustomButtonStyles.fillPrimary,
                            buttonTextStyle: theme.textTheme.titleMedium!
                                .copyWith(color: appTheme.white),
                            onPressed: () {
                              BlocProvider.of<AuthCubit>(context).verifyOTP(
                                  enteryourOTPController.text.toString(), true);
                            });
                      },
                    ),
                    SizedBox(height: 146.v),
                    GestureDetector(
                      onTap: () {
                        onTapTxtAlreadyamember(context);
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Not a member? ",
                              style: theme.textTheme.bodyLarge,
                            ),
                            TextSpan(
                              text: "Register Now",
                              style:
                                  CustomTextStyles.titleMediumPoppinsWhiteA700,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

onTapTxtAlreadyamember(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.registerScreen);
}

onTapLogin(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.sellerbottomBarScreen);
}
