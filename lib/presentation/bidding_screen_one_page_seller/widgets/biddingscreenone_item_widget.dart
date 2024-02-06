import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/data/models/bid_model.dart';

// ignore: must_be_immutable
class BiddingscreenlistItemWidget extends StatelessWidget {
  BiddingscreenlistItemWidget({
    Key? key,
    this.bid,
  }) : super(
          key: key,
        );
  BidModel? bid;
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 24.h),
      padding: EdgeInsets.symmetric(
        horizontal: 14.h,
        vertical: 11.v,
      ),
      decoration: AppDecoration.fillGray300.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: bid?.quote.product.images[0],
            fit: BoxFit.cover,
            height: 115.v,
            width: 98.h,
            radius: BorderRadius.circular(
              10.h,
            ),
          ),
          Container(
            height: 121.v,
            width: 166.h,
            margin: EdgeInsets.only(
              left: 16.h,
              top: 6.v,
              bottom: 6.v,
            ),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(right: 1.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 165.h,
                          child: Text(
                            bid?.quote.product.title ?? '',
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
                                "${bid?.deliveryDays} Working Days",
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
                                text: bid?.price.toString() ?? '',
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
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 12.v),
                    child: Text(
                      "Bided",
                      style: CustomTextStyles.montserratLightblue800,
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
