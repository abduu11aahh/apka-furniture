import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Apka_Furniture/bloc/AuthBloc/auth_cubit.dart';
import 'package:Apka_Furniture/bloc/ProposalBloc/proposal_cubit.dart';
import 'package:Apka_Furniture/core/app_export.dart';
import 'package:Apka_Furniture/data/models/proposal_model.dart';
import 'package:Apka_Furniture/presentation/proposal_screen_dialog/proposal_screen_dialog.dart';
import 'package:Apka_Furniture/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class BiddingscreenoneItemWidget extends StatelessWidget {
  BiddingscreenoneItemWidget({
    Key? key,
    this.onTapConfirm,
    this.proposal,
  }) : super(
          key: key,
        );
  ProposalModel? proposal;
  VoidCallback? onTapConfirm;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 11.v),
      decoration: AppDecoration.fillGray300.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomImageView(
            imagePath: proposal?.product.images[0],
            height: 115.v,
            width: 98.h,
            fit: BoxFit.cover,
            radius: BorderRadius.circular(
              10.h,
            ),
          ),
          Container(
            height: 121.v,
            width: 172.h,
            margin: EdgeInsets.symmetric(vertical: 6.v),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 165.h,
                        child: Text(
                          proposal?.product.title ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelMedium!.copyWith(
                            height: 1.33,
                          ),
                        ),
                      ),
                      SizedBox(height: 7.v),
                      Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgVector,
                            height: 12.adaptSize,
                            width: 12.adaptSize,
                            margin: EdgeInsets.only(bottom: 1.v),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.h),
                            child: Text(
                              "${proposal?.deliveryDays} Working Days",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.4),
                                fontSize: 11.fSize,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 9.v),
                      Text(
                        "Price:",
                        style: theme.textTheme.labelSmall,
                      ),
                      SizedBox(height: 1.v),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: proposal?.price.toString() ?? '',
                              style: theme.textTheme.titleMedium,
                            ),
                            TextSpan(
                              text: "pkr",
                              style: CustomTextStyles.labelSmallBold_1,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 1.v),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            String token = context.read<AuthCubit>().getToken();
                            context
                                .read<ProposalCubit>()
                                .onTapNegative(token, proposal);
                          },
                          child: Container(
                              height: 25.v,
                              width: 30.h,
                              decoration: BoxDecoration(
                                  color: theme.colorScheme.primary,
                                  borderRadius: BorderRadius.circular(
                                    5.h,
                                  )),
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 3.v),
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgLine2,
                                  height: 2.v,
                                  width: 8.h,
                                  alignment: Alignment.bottomCenter,
                                  margin: EdgeInsets.only(bottom: 8.v),
                                ),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.h),
                          child: CustomElevatedButton(
                            height: 25.v,
                            width: 65.h,
                            text: "Confirm",
                            margin: EdgeInsets.only(left: 2.h),
                            buttonStyle: CustomButtonStyles.fillPrimaryTL4,
                            buttonTextStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 11.fSize,
                              fontWeight: FontWeight.w600,
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        content: ProposalScreenDialog(),
                                        backgroundColor: Colors.transparent,
                                        contentPadding: EdgeInsets.zero,
                                        insetPadding:
                                            const EdgeInsets.only(left: 0),
                                      ));
                              String token =
                                  context.read<AuthCubit>().getToken();
                              context
                                  .read<ProposalCubit>()
                                  .onTapConfirm(token, proposal);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
