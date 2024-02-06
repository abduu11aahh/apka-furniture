import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/data/models/quote_model.dart';
import 'package:frontend/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class CartscreenTwoQuotedItemWidget extends StatelessWidget {
  CartscreenTwoQuotedItemWidget({
    Key? key,
    this.quote,
  }) : super(
          key: key,
        );
  QuoteModel? quote;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 11.v),
      decoration: BoxDecoration(
          color: appTheme.gray, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomImageView(
            imagePath: '${quote?.product.images[0]}',
            height: 100.v,
            fit: BoxFit.cover,
            width: 98.h,
            radius: BorderRadius.circular(
              10.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 165.h,
                  child: Text(
                    '${quote?.product.title}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelMedium!.copyWith(
                      height: 1.33,
                    ),
                  ),
                ),
                SizedBox(height: 8.v),
                SizedBox(
                  width: 165.h,
                  child: Text(
                    '${quote?.product.details}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall!.copyWith(
                      height: 1.33,
                    ),
                  ),
                ),
                // Row(
                //   children: [
                //     Text(
                //       "Color :",
                //       style: theme.textTheme.labelSmall,
                //     ),
                //     Opacity(
                //       opacity: 0.5,
                //       child: Padding(
                //         padding: EdgeInsets.only(left: 6.h),
                //         child: Text(
                //           "Grey",
                //           style: CustomTextStyles.labelSmallOnPrimaryContainer,
                //         ),
                //       ),
                //     ),
                //     Padding(
                //       padding: EdgeInsets.only(left: 25.h),
                //       child: Text(
                //         "Material : ",
                //         style: theme.textTheme.labelSmall,
                //       ),
                //     ),
                //     Opacity(
                //       opacity: 0.5,
                //       child: Padding(
                //         padding: EdgeInsets.only(left: 5.h),
                //         child: Text(
                //           "Wood",
                //           style: CustomTextStyles.labelSmallOnPrimaryContainer,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 16.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("Quote in Process",
                      style: theme.textTheme.labelSmall!
                          .copyWith(color: appTheme.lightBlue)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
