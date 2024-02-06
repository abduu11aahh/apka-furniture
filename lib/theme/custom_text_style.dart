import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeOnPrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(0.53),
      );
  static get bodyLargeOnPrimaryContainer_1 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodyLargeWhiteA700 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.whiteA700.withOpacity(0.53),
      );
  static get bodyMediumOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(0.53),
        fontSize: 13.fSize,
      );
  static get bodyMediumPoppinsOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(0.53),
        fontWeight: FontWeight.w300,
      );
  static get bodySmallOnPrimaryContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(0.53),
        fontSize: 11.fSize,
      );
  static get bodySmallOnPrimaryContainer12 =>
      theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(0.48),
        fontSize: 12.fSize,
      );
  static get bodySmallOnPrimaryContainer_1 =>
      theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(0.53),
      );
  static get bodySmallPoppinsOnPrimaryContainer =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(0.53),
        fontSize: 12.fSize,
        fontWeight: FontWeight.w300,
      );
  // Headline text style
  static get headlineMediumMontserrat =>
      theme.textTheme.headlineMedium!.montserrat.copyWith(
        fontWeight: FontWeight.w800,
      );
  static get headlineMediumMontserratOnPrimaryContainer =>
      theme.textTheme.headlineMedium!.montserrat.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w800,
      );
  static get headlineMediumMontserratOnPrimaryContainer27 =>
      theme.textTheme.headlineMedium!.montserrat.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(0.65),
        fontSize: 27.fSize,
      );
  static get headlineSmallSemiBold => theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  // Label text style
  static get labelLarge13 => theme.textTheme.labelLarge!.copyWith(
        fontSize: 13.fSize,
      );
  static get labelLargeMedium => theme.textTheme.labelLarge!.copyWith(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeMedium13 => theme.textTheme.labelLarge!.copyWith(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeOnPrimaryContainer =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(0.53),
        fontWeight: FontWeight.w500,
      );
  static get labelLargeOnPrimaryContainer_1 =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(0.62),
      );
  static get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 13.fSize,
      );
  static get labelMediumBluegray900 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.blueGray900.withOpacity(0.62),
      );
  static get labelMediumOnPrimaryContainer =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(0.53),
        fontWeight: FontWeight.w600,
      );
  static get labelMediumOnPrimaryContainerBold =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(0.53),
        fontWeight: FontWeight.w700,
      );
  static get labelMediumOnPrimaryContainerSemiBold =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(0.62),
        fontWeight: FontWeight.w600,
      );
  static get labelMediumPoppinsWhiteA700 =>
      theme.textTheme.labelMedium!.poppins.copyWith(
        color: appTheme.whiteA700.withOpacity(0.62),
        fontWeight: FontWeight.w600,
      );
  static get labelSmall9 => theme.textTheme.labelSmall!.copyWith(
        fontSize: 9.fSize,
      );
  static get labelSmallBold => theme.textTheme.labelSmall!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get labelSmallBold_1 => theme.textTheme.labelSmall!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get labelSmallGray60002 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.gray60002,
        fontWeight: FontWeight.w600,
      );
  static get labelSmallOnPrimary => theme.textTheme.labelSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 9.fSize,
        fontWeight: FontWeight.w600,
      );
  static get labelSmallOnPrimaryContainer =>
      theme.textTheme.labelSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(0.53),
      );
  static get labelSmallOnPrimaryContainerSemiBold =>
      theme.textTheme.labelSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(0.53),
        fontWeight: FontWeight.w600,
      );
  static get labelSmallPrimary => theme.textTheme.labelSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get labelSmallPrimaryExtraBold => theme.textTheme.labelSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w800,
      );
  static get labelSmallPrimarySemiBold => theme.textTheme.labelSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get labelSmallSemiBold => theme.textTheme.labelSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get labelSmallWhiteA700 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get labelSmallWhiteA700SemiBold =>
      theme.textTheme.labelSmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 9.fSize,
        fontWeight: FontWeight.w600,
      );
  // Montserrat text style
  static get montserratBluegray900 => TextStyle(
        color: appTheme.blueGray900.withOpacity(0.53),
        fontSize: 7.fSize,
        fontWeight: FontWeight.w500,
      ).montserrat;
  static get montserratBluegray900Medium => TextStyle(
        color: appTheme.blueGray900.withOpacity(0.62),
        fontSize: 10.fSize,
        fontWeight: FontWeight.w500,
      ).montserrat;
  static get montserratLightblue800 => TextStyle(
        color: appTheme.lightBlue800,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w700,
      ).montserrat;
  static get montserratSecondaryContainer => TextStyle(
        color: theme.colorScheme.secondaryContainer,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w600,
      ).montserrat;
  static get montserratWhiteA700 => TextStyle(
        color: appTheme.whiteA700,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w600,
      ).montserrat;
  static get montserratWhiteA700SemiBold => TextStyle(
        color: appTheme.whiteA700,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w600,
      ).montserrat;
  // Title style
  static get titleLargePoppins => theme.textTheme.titleLarge!.poppins;
  static get titleLargePoppinsOnPrimaryContainer =>
      theme.textTheme.titleLarge!.poppins.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(0.53),
        fontSize: 21.fSize,
      );
  static get titleMediumDeeporangeA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.deepOrangeA700,
      );
  static get titleMediumMedium => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumPoppins =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumPoppinsWhiteA700 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumPoppinsWhiteA700Medium =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumPoppinsWhiteA700SemiBold =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumSemiBold => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumSemiBold_1 => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleMediumSemiBold_2 => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleMediumWhiteA700SemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallBluegray900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallOnPrimaryContainer =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static get titleSmallPoppinsOnPrimaryContainer =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(0.53),
      );
  static get titleSmallRedA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.redA700,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
}

extension on TextStyle {
  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
