import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Apka_Furniture/bloc/AuthBloc/auth_cubit.dart';
import 'package:Apka_Furniture/bloc/BidBloc/bid_cubit.dart';
import 'package:Apka_Furniture/bloc/BidBloc/bid_state.dart';
import 'package:Apka_Furniture/bloc/ProposalBloc/proposal_cubit.dart';
import 'package:Apka_Furniture/bloc/bottomBarBloc/sellerBottomBarCubit.dart';
import 'package:Apka_Furniture/core/app_export.dart';
import 'package:Apka_Furniture/data/models/quote_model.dart';
import 'package:Apka_Furniture/presentation/bidding_screen/bidding_screen.dart';
import 'package:Apka_Furniture/presentation/bidding_screen_seller/bidding_screen.dart';
import 'package:Apka_Furniture/widgets/custom_elevated_button.dart';
import 'package:Apka_Furniture/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class OrderScreenTwoDialog extends StatelessWidget {
  final QuoteModel quote;
  OrderScreenTwoDialog({Key? key, required this.quote}) : super(key: key);

  TextEditingController priceController = TextEditingController();
  TextEditingController deliveryDaysController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp numberRegex = RegExp(r'^[0-9]*(?:\.[0-9]*)?$');
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Form(
      key: _formKey,
      child: Container(
        width: 311.h,
        padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 30.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text("Give Buyer a Good Match ",
              style: CustomTextStyles.titleMediumSemiBold_1),
          SizedBox(height: 17.v),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Price", style: theme.textTheme.labelLarge)),
          SizedBox(height: 11.v),
          Padding(
              padding: EdgeInsets.only(left: 0.h, right: 0.h),
              child: CustomTextFormField(
                  controller: priceController,
                  textInputType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !numberRegex.hasMatch(value)) {
                      return 'Please enter a valid number for price!';
                    }
                    return null;
                  },
                  suffix: Container(
                      padding: EdgeInsets.fromLTRB(30.h, 7.v, 15.h, 9.v),
                      decoration: BoxDecoration(
                          color: appTheme.gray200,
                          borderRadius: BorderRadius.circular(8.h)),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgEdit,
                          height: 15.adaptSize,
                          width: 15.adaptSize)),
                  suffixConstraints: BoxConstraints(maxHeight: 32.v),
                  borderDecoration: TextFormFieldStyleHelper.fillGray)),
          SizedBox(height: 15.v),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Delivery Days", style: theme.textTheme.labelLarge)),
          SizedBox(height: 9.v),
          CustomTextFormField(
              controller: deliveryDaysController,
              textInputType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !numberRegex.hasMatch(value)) {
                  return 'Please enter a valid number for delivery days!';
                } else {
                  return null;
                }
              },
              suffix: Container(
                  padding: EdgeInsets.fromLTRB(30.h, 7.v, 15.h, 9.v),
                  decoration: BoxDecoration(
                      color: appTheme.gray200,
                      borderRadius: BorderRadius.circular(8.h)),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgVectorBlueGray900,
                      height: 15.adaptSize,
                      width: 15.adaptSize)),
              suffixConstraints: BoxConstraints(maxHeight: 32.v),
              borderDecoration: TextFormFieldStyleHelper.fillGray),
          SizedBox(height: 30.v),
          BlocConsumer<BidCubit, BidState>(
            listener: (context, state) {
              if (state is BidErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.red,
                  ),
                );
              }
              if (state is BidSuccessState) {
                context
                    .read<SellerBottomBarCubit>()
                    .setCurrentTab(2, BiddingScreenSeller());
                Navigator.pushNamed(context, AppRoutes.sellerbottomBarScreen);
              }
            },
            builder: (context, state) {
              if (state is BidLoadingState) {
                return CircularProgressIndicator();
              }
              return CustomElevatedButton(
                  height: 41.v,
                  text: "Bid",
                  margin: EdgeInsets.only(left: 9.h, right: 10.h),
                  buttonStyle: CustomButtonStyles.fillPrimary,
                  buttonTextStyle: CustomTextStyles.labelLargeWhiteA700,
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      String token = context.read<AuthCubit>().getToken();
                      int quoteId = quote.quoteId;
                      String price = priceController.text;
                      String deliveryDays = deliveryDaysController.text;
                      context.read<BidCubit>().addBid(int.parse(price),
                          int.parse(deliveryDays), quoteId, token);
                      //  Navigator.pushNamed(context, AppRoutes.orderScreenTabContainerScreen);
                    }
                  });
            },
          )
        ]),
      ),
    );
  }

  /// Navigates to the orderScreenTabContainerScreen when the action is triggered.
}
