import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';

// ignore: must_be_immutable
class CategoryWidget extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  String? text;
  Color? color;
  String? imagePath;

  CategoryWidget({
    Key? key,
    this.text,
    this.color,
    this.imagePath,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key) {
    if (text == 'Table') {
      height = 53.adaptSize;
      width = 53.adaptSize;
      margin = 5;
    } else if (text == 'Bed') {
      height = 42.adaptSize;
      width = 47.adaptSize;
      margin = 5;
    } else if (text == 'Chair') {
      height = 40.adaptSize;
      width = 47.adaptSize;
      margin = 12.v;
    } else if (text == 'Sofa') {
      height = 47.adaptSize;
      width = 45.adaptSize;
      margin = 8;
    } else {
      height = 25.adaptSize;
      width = 25.adaptSize;
      margin = 18.v;
    }
  }

  late double height;
  late double width;
  late double margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 18.h),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: 50.h,
          child: SizedBox(
            height: 70.v,
            width: 50.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 55.v,
                        width: 55.h,
                        decoration: BoxDecoration(
                          color: color,
                          // border: Border.all(
                          //   color: isSelected ? Colors.red : Colors.white,
                          //   width: 2.0,
                          // ),
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.7),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ]
                              : [],
                        ),
                      ),
                      SizedBox(height: 5.v),
                      Text(
                        text!,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer
                              .withOpacity(0.4),
                        ),
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
