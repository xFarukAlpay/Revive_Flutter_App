import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {


  // Filled button style
  static ButtonStyle get fillOnErrorContainer => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.onErrorContainer,
    elevation: 0,
    padding: EdgeInsets.zero,
  );

  static ButtonStyle get fillBlue => ElevatedButton.styleFrom(
    backgroundColor: Colors.blueAccent,
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 16.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  // Text button style
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    elevation: MaterialStateProperty.all<double>(0),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
    side: MaterialStateProperty.all<BorderSide>(
      BorderSide(color: Colors.transparent),
    ),
  );
}