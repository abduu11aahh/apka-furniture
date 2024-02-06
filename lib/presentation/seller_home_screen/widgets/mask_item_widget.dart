import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class MaskItemWidget extends StatelessWidget {
  const MaskItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 154.v,
        width: 330.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 154.v,
                width: 147.h,
                decoration: BoxDecoration(
                    //color: Colors.white,
                    // gradient: LinearGradient(
                    //   begin: Alignment(0, 0.5),
                    //   end: Alignment(1, 0.5),
                    //   colors: [
                    //     theme.colorScheme.onPrimaryContainer.withOpacity(0.5),
                    //     appTheme.blueGray100.withOpacity(0.5),
                    //   ],
                    // ),
                    ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 154.v,
                width: 330.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Opacity(
                    //   opacity: 0.75,
                    //   child: CustomImageView(
                    //     imagePath: ImageConstant.imgEllipse1154x330,
                    //     height: 154.v,
                    //     width: 330.h,
                    //     alignment: Alignment.center,
                    //   ),
                    // ),
                    Align(
                      alignment: Alignment.center,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 0,
                        ///////////////////////////////////////////
                        color: Colors.lightBlueAccent,
                        margin: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusStyle.roundedBorder10,
                        ),
                        child: Container(
                          height: 154.v,
                          width: 330.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 1.h,
                            vertical: 4.v,
                          ),
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadiusStyle.roundedBorder10,
                          //   image: DecorationImage(
                          //     image: AssetImage(
                          //       ImageConstant.imgGroup364,
                          //     ),
                          //     fit: BoxFit.cover,
                          //   ),
                          // ),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgLovepikSofaTa,
                                height: 139.v,
                                width: 187.h,
                                radius: BorderRadius.circular(
                                  10.h,
                                ),
                                alignment: Alignment.topRight,
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 20.h,
                                    bottom: 22.v,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "",
                                        style: CustomTextStyles
                                            .labelSmallWhiteA700SemiBold,
                                      ),
                                      SizedBox(height: 12.v),
                                      CustomElevatedButton(
                                        height: 23.v,
                                        width: 87.h,
                                        text: "Explore Now",
                                        buttonStyle:
                                            CustomButtonStyles.fillWhiteATL7,
                                        buttonTextStyle:
                                            CustomTextStyles.labelSmallBold,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 131.h,
                                  margin: EdgeInsets.only(
                                    left: 20.h,
                                    top: 17.v,
                                  ),
                                  child: Text(
                                    "New\nSofas",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles
                                        .headlineMediumMontserrat,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
