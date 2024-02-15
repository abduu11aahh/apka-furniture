import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:Apka_Furniture/core/app_export.dart';

// ignore: must_be_immutable
class NotificationscreenItemWidget extends StatelessWidget {
  final RemoteNotification notification;
  const NotificationscreenItemWidget({
    Key? key,
    required this.notification,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.v),
      // decoration: AppDecoration.fillLightBlue.copyWith(
      //   borderRadius: BorderRadiusStyle.roundedBorder10,
      // ),
      decoration: BoxDecoration(
          color: appTheme.lightBlue.withOpacity(0.50),
          borderRadius: BorderRadius.circular(
            10.h,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // CustomImageView(
          //   imagePath: ImageConstant.imgRectangle70,
          //   height: 80.v,
          //   width: 70.h,
          //   radius: BorderRadius.circular(
          //     6.h,
          //   ),
          //   margin: EdgeInsets.only(top: 1.v),
          // ),
          Padding(
            padding: EdgeInsets.only(top: 1.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title!,
                  style: theme.textTheme.labelLarge,
                ),
                SizedBox(height: 4.v),
                Opacity(
                  opacity: 0.75,
                  child: SizedBox(
                    width: 178.h,
                    child: Opacity(
                      opacity: 0.5,
                      child: Text(
                        notification.body!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                            //height: 1.60,
                            ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Opacity(
                    opacity: 0.4,
                    // child: Text(
                    //   "1 hour ago",
                    //   style: theme.textTheme.bodySmall,
                    // ),
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
