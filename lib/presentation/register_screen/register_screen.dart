import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/AuthBloc/auth_cubit.dart';
import 'package:frontend/bloc/AuthBloc/auth_sate.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/widgets/custom_elevated_button.dart';
import 'package:frontend/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  TextEditingController userNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  //static String verifyID = '';

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    bool registerBuyer =
        ModalRoute.of(context)?.settings.arguments as bool? ?? false;
    print("registerBuyerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr$registerBuyer");
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
              child: Form(
                  key: _formKey,
                  child: SizedBox(
                      width: double.maxFinite,
                      child: Column(children: [
                        Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                                height: 479.v,
                                width: 330.h,
                                child: Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: [
                                      Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 187.v),
                                          child: CustomTextFormField(
                                              width: 300.h,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter a valid full name';
                                                }
                                                return null;
                                              },
                                              controller: userNameController,
                                              hintText: "Full Name",
                                              alignment: Alignment.bottomLeft,
                                              hintStyle: CustomTextStyles
                                                  .bodyMediumPoppinsOnPrimaryContainer,
                                              borderDecoration:
                                                  TextFormFieldStyleHelper
                                                      .fillWhiteA,
                                              fillColor: appTheme.white)),
                                      Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 105.v),
                                          child: CustomTextFormField(
                                              width: 300.h,
                                              controller: phoneNumberController,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty ||
                                                    !RegExp(r'^\+92\d{10}$')
                                                        .hasMatch(value)) {
                                                  return 'Please enter a valid phone number';
                                                }
                                                return null;
                                              },
                                              hintText: "Phone Number",
                                              textInputAction:
                                                  TextInputAction.done,
                                              textInputType:
                                                  TextInputType.phone,
                                              hintStyle: CustomTextStyles
                                                  .bodyMediumPoppinsOnPrimaryContainer,
                                              alignment: Alignment.bottomLeft,
                                              borderDecoration:
                                                  TextFormFieldStyleHelper
                                                      .fillWhiteA,
                                              fillColor: appTheme.white)),
                                      BlocConsumer<AuthCubit, AuthState>(
                                        listener: (context, state) {
                                          // TODO: implement listener
                                          if (state is AuthCodeSentState) {
                                            Navigator.pushNamed(
                                                context, AppRoutes.otpScreen);
                                          }
                                        },
                                        builder: (context, state) {
                                          if (state is AuthLoadingState) {
                                            return Container(
                                              height: 50.v,
                                              width: 300.h,
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                              Color>(
                                                          theme.colorScheme
                                                              .primary),
                                                ),
                                              ),
                                            );
                                          }
                                          return CustomElevatedButton(
                                              height: 50.v,
                                              width: 300.h,
                                              text: "Send OTP",
                                              buttonStyle: CustomButtonStyles
                                                  .fillPrimary,
                                              buttonTextStyle: theme
                                                  .textTheme.titleMedium!
                                                  .copyWith(
                                                      color: appTheme.white),
                                              onPressed: () {
                                                if (_formKey.currentState
                                                        ?.validate() ??
                                                    false) {
                                                  BlocProvider.of<AuthCubit>(
                                                          context)
                                                      .sendOTP(
                                                          phoneNumberController
                                                              .text,
                                                          userNameController
                                                              .text,
                                                          registerBuyer);
                                                }
                                              },
                                              alignment: Alignment.bottomLeft);
                                        },
                                      )
                                    ]))),
                        Spacer(),
                        GestureDetector(
                            onTap: () {
                              onTapTxtAlreadyamember(context);
                            },
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "Already a member? ",
                                      style: theme.textTheme.bodyLarge!
                                          .copyWith(color: appTheme.white)),
                                  TextSpan(
                                      text: "Login Now!",
                                      style: theme.textTheme.titleMedium!
                                          .copyWith(color: appTheme.white))
                                ]),
                                textAlign: TextAlign.left)),
                        SizedBox(height: 53.v),
                      ]))),
            )));
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtAlreadyamember(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}
