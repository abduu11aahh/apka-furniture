import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';

// ignore: must_be_immutable
class CategoryWidget extends StatelessWidget {
  CategoryWidget(
      {Key? key, this.onTapView, this.text, this.color, this.imagePath})
      : super(
          key: key,
        ) {
    if (text == 'Table') {
      height = 53.adaptSize;
      width = 53.adaptSize;
      margin = 0;
    } else if (text == 'Bed') {
      height = 42.adaptSize;
      width = 47.adaptSize;
      margin = 0;
    } else if (text == 'Chair') {
      height = 40.adaptSize;
      width = 47.adaptSize;
      margin = 5.v;
    } else if (text == 'Sofa') {
      height = 47.adaptSize;
      width = 45.adaptSize;
      margin = 0;
    } else {
      height = 25.adaptSize;
      width = 25.adaptSize;
      margin = 12.v;
    }
  }

  VoidCallback? onTapView;
  String? text;
  Color? color;
  String? imagePath;

  late double height;
  late double width;
  late double margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: SizedBox(
        width: 50.h,
        child: GestureDetector(
          onTap: () {
            onTapView!.call();
          },
          child: SizedBox(
            height: 66.v,
            width: 50.h,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 50.adaptSize,
                        width: 50.adaptSize,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(
                            22.h,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.v),
                      Text(
                        text!,
                        style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer
                                .withOpacity(0.4)),
                      ),
                    ],
                  ),
                ),
                CustomImageView(
                  imagePath: imagePath,
                  margin: EdgeInsets.only(top: margin),
                  height: height,
                  width: width,
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
