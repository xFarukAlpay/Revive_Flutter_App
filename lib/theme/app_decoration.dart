import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillIndigoA => BoxDecoration(
    color: appTheme.indigoA70019,
  );

  static BoxDecoration get fillOnErrorContainer => BoxDecoration(
    color: theme.colorScheme.onErrorContainer,
  );

  // Gradient decorations
  static BoxDecoration get gradientOnErrorContainerToOnErrorContainer =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0, 0),
          end: Alignment(0, 1),
          colors: [
            theme.colorScheme.onErrorContainer.withOpacity(0),
            theme.colorScheme.onErrorContainer,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
    color: theme.colorScheme.onErrorContainer,
    border: Border.all(
      color: appTheme.black90001,
      width: 1.h,
    ),
  );

  static BoxDecoration get outlineBlack90001 => BoxDecoration();

  static BoxDecoration get outlineGrayC => BoxDecoration(
    color: theme.colorScheme.onErrorContainer,
    boxShadow: [
      BoxShadow(
        color: appTheme.gray9001c,
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(0, 0),
      ),
    ],
  );

  static BoxDecoration get outlineIndigoA => BoxDecoration(
    color: appTheme.indigoA70019,
    border: Border.all(
      color: appTheme.indigoA70019,
      width: 3.h,
      strokeAlign: BorderSide.strokeAlignOutside,
    ),
  );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder32 => BorderRadius.circular(32.h);

  // Rounded borders
  static BorderRadius get roundedBorder2 => BorderRadius.circular(2.h);
  static BorderRadius get roundedBorder28 => BorderRadius.circular(28.h);
  static BorderRadius get roundedBorder8 => BorderRadius.circular(8.h);
}
