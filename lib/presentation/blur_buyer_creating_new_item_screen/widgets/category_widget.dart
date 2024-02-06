import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';

// ignore: must_be_immutable
class CategoryWidget extends StatelessWidget {
  CategoryWidget(
      {Key? key, this.onTapView, this.text, this.color, this.imagePath})
      : super(
          key: key,
        );

  VoidCallback? onTapView;
  String? text;
  Color? color;
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22.0),
      child: SizedBox(
        width: 50.h,
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
                margin: EdgeInsets.only(bottom: 0),
                height: 40.adaptSize,
                width: 45.adaptSize,
                alignment: Alignment.topCenter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
