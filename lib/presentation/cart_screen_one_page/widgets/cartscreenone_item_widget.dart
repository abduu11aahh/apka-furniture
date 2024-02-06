import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/cartBloc/cart_cubit.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/data/models/product_model.dart';
import 'package:frontend/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class CartscreenoneItemWidget extends StatelessWidget {
  final ProductModel cartItem;
  const CartscreenoneItemWidget({Key? key, required this.cartItem})
      : super(
          key: key,
        );

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
            imagePath: cartItem.images[0],
            height: 100.v,
            width: 98.h,
            fit: BoxFit.cover,
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
                    cartItem.title,
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
                    '${cartItem.details}',
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
                CustomElevatedButton(
                  onPressed: () {
                    context.read<CartCubit>().removeFromCart(cartItem);
                  },
                  height: 23.v,
                  width: 76.h,
                  text: "Remove",
                  buttonStyle: CustomButtonStyles.fillLightBlueTL7,
                  buttonTextStyle: theme.textTheme.labelSmall!
                      .copyWith(color: appTheme.white),
                  alignment: Alignment.centerRight,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
