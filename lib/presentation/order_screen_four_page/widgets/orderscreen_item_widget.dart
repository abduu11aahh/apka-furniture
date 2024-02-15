import 'package:flutter/material.dart';
import 'package:Apka_Furniture/core/app_export.dart';
import 'package:Apka_Furniture/data/models/quote_model.dart';
import 'package:Apka_Furniture/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class OrderscreenItemWidget extends StatelessWidget {
  OrderscreenItemWidget({
    Key? key,
    this.onTapBidButton,
    this.quote,
  }) : super(
          key: key,
        );

  VoidCallback? onTapBidButton;
  QuoteModel? quote;
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
            imagePath: '${quote?.product.images[0]}',
            fit: BoxFit.cover,
            height: 115.v,
            width: 98.h,
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
                          '${quote?.product.title}',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelMedium!.copyWith(
                            height: 1.33,
                          ),
                        ),
                      ),
                      SizedBox(height: 7.v),
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
                      //     CustomImageView(
                      //       imagePath: ImageConstant.imgVector,
                      //       height: 12.adaptSize,
                      //       width: 12.adaptSize,
                      //       margin: EdgeInsets.only(bottom: 1.v),
                      //     ),
                      //     Padding(
                      //       padding: EdgeInsets.only(left: 4.h),
                      //       child: Text(
                      //         "20 - 28 Working Days",
                      //         style: TextStyle(
                      //           color: Colors.black.withOpacity(0.4),
                      //           fontSize: 11.fSize,
                      //           fontWeight: FontWeight.w600,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(height: 15.v),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: CustomElevatedButton(
                    height: 25.v,
                    width: 75.h,
                    text: "Bid",
                    margin: EdgeInsets.only(left: 2.h),
                    buttonStyle: CustomButtonStyles.fillPrimaryTL14,
                    buttonTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 11.fSize,
                      fontWeight: FontWeight.w600,
                    ),
                    onPressed: () {
                      onTapBidButton!.call();
                    },
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


// ignore: must_be_immutable
// class OrderscreenItemWidget extends StatelessWidget {
//   OrderscreenItemWidget({
//     Key? key,
//     this.onTapBidButton,
//   }) : super(
//           key: key,
//         );

//   VoidCallback? onTapBidButton;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 11.v),
//       decoration: AppDecoration.fillGray300.copyWith(
//         borderRadius: BorderRadiusStyle.roundedBorder10,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           CustomImageView(
//             imagePath: ImageConstant.imgRectangle18,
//             height: 100.v,
//             width: 98.h,
//             radius: BorderRadius.circular(
//               10.h,
//             ),
//           ),
//           Container(
//             height: 88.v,
//             width: 166.h,
//             margin: EdgeInsets.symmetric(vertical: 6.v),
//             child: Stack(
//               alignment: Alignment.bottomRight,
//               children: [
//                 Align(
//                   alignment: Alignment.center,
//                   child: Padding(
//                     padding: EdgeInsets.only(right: 1.h),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 165.h,
//                           child: Text(
//                             "Swedish Wood and Linen Bed\nGrey - 200x120x140 cm",
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: theme.textTheme.labelMedium!.copyWith(
//                               height: 1.33,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 7.v),
//                         Row(
//                           children: [
//                             CustomImageView(
//                               imagePath: ImageConstant.imgVector,
//                               height: 9.adaptSize,
//                               width: 9.adaptSize,
//                               margin: EdgeInsets.only(bottom: 1.v),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(left: 4.h),
//                               child: Text(
//                                 "12 - 14 Working Days",
//                                 style: CustomTextStyles
//                                     .montserratSecondaryContainer,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 17.v),
//                         CustomElevatedButton(
//                           height: 23.v,
//                           width: 76.h,
//                           text: "Bid",
//                           buttonTextStyle: CustomTextStyles.labelSmallWhiteA700,
//                           onPressed: () {
//                             onTapBidButton!.call();
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: Padding(
//                     padding: EdgeInsets.only(bottom: 6.v),
//                     child: Text(
//                       "Upon Demand",
//                       style: CustomTextStyles.montserratLightblue800,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
