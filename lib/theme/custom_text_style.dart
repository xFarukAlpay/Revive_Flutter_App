import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension CustomTextStyleExtension on TextStyle {
  TextStyle get kalam {
    return copyWith(
      fontFamily: 'Kalam',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get rosarivo {
    return copyWith(
      fontFamily: 'Rosarivo',
    );
  }

  TextStyle get karma {
    return copyWith(
      fontFamily: 'Karma',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get sedan {
    return copyWith(
      fontFamily: 'Sedan',
    );
  }
}







class CustomTextStyles {
  // Body text style
  static TextStyle get bodyMediumBlack90001 =>
      theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.black90001,
  );

  static TextStyle get bodyMediumErrorContainer =>
      theme.textTheme.bodyMedium!.copyWith(
    color: theme.colorScheme.errorContainer,
  );

  static TextStyle get bodyMediumIndigoA700 =>
      theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.indigoA700,
  );

  static TextStyle get bodyMediumOnErrorContainer =>
      theme.textTheme.bodyMedium!.copyWith(
    color: theme.colorScheme.onErrorContainer,
  );

  static TextStyle get bodyMediumPrimaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
    color: theme.colorScheme.primaryContainer,
  );

  static TextStyle get bodyMediumSedanOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.sedan.copyWith(
    color: theme.colorScheme.onPrimaryContainer,
  );

  static TextStyle get bodySmallBlack90001 =>
      theme.textTheme.bodySmall!.copyWith(
    color: appTheme.black90001,
    fontSize: 12,
  );

  static TextStyle get bodySmallErrorContainer =>
      theme.textTheme.bodySmall!.copyWith(
    color: theme.colorScheme.errorContainer,
  );

  static TextStyle get bodySmallGray500 =>
      theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray500,
    fontSize: 12,
  );

  static TextStyle get bodySmallIndigoA700 =>
      theme.textTheme.bodySmall!.copyWith(
    color: appTheme.indigoA700,
  );

  static TextStyle get bodySmallOnErrorContainer =>
      theme.textTheme.bodySmall!.copyWith(
    color: theme.colorScheme.onErrorContainer,
  );

  // Title text style
  static TextStyle get titleLargeInterBlack90001 =>
      theme.textTheme.titleLarge!.inter.copyWith(
    color: appTheme.black90001,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get titleLargeKalamBlack90001 =>
      theme.textTheme.titleLarge!.kalam.copyWith(
    color: appTheme.black90001,
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get titleLargeKarmaBlack90001 =>
      theme.textTheme.titleLarge!.karma.copyWith(
    color: appTheme.black90001,
     fontWeight: FontWeight.w400,
  );

  static TextStyle get titleMediumBlack90001 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black90001,
  );

  static TextStyle get titleMediumOnErrorContainer =>
      theme.textTheme.titleMedium!.copyWith(
    color: theme.colorScheme.onErrorContainer,
  );
}
