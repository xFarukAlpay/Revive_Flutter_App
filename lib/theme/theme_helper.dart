import 'package:flutter/material.dart';
import '../core/app_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
// ignore_for_file: must_be_immutable

class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors(),
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme,
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData getThemeData() {
    var colorScheme = _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;

    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onErrorContainer,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.gray700,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 2,
        space: 2,
        color: appTheme.black90001,
      ),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => getThemeData();
}

class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    bodyMedium: TextStyle(
      color: appTheme.gray500,
      fontSize: 14,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: appTheme.gray700,
      fontSize: 10,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      color: colorScheme.onPrimaryContainer,
      fontSize: 24,
      fontFamily: 'Rosarivo',
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle(
      color: colorScheme.onPrimaryContainer,
      fontSize: 20,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      color: colorScheme.onPrimaryContainer,
      fontSize: 16,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      color: appTheme.gray700,
      fontSize: 14,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
    ),
  );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0xFF202022),
    primaryContainer: Color(0xFF2E8BE2),
    errorContainer: Color(0xFF3D3D3D),
    onErrorContainer: Color(0xFFFFFFFF),
    onPrimary: Color(0x33BFBFBF),
    onPrimaryContainer: Color(0xFF0F0F0F),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // Black
  Color get black900 => Color(0xFF090909);
  Color get black90001 => Color(0xFF000000);

  // DeepOrange
  Color get deepOrange200 => Color(0xFFFCB49E);

  // Gray
  Color get gray300 => Color(0xFFDDDDDD);
  Color get gray30001 => Color(0xFFE5E5E5);
  Color get gray500 => Color(0xFF9E9E9E);
  Color get gray700 => Color(0xFF666666);
  Color get gray900 => Color(0xFF201D1D);
  Color get gray90019 => Color(0x19090626);
  Color get gray9001c => Color(0x1C17171F);

  // Indigo
  Color get indigoA700 => Color(0xFF4937F8);
  Color get indigoA70001 => Color(0xFF2F45FF);
  Color get indigoA70019 => Color(0x193F2FFF);

  // LightBlue
  Color get lightBlue100 => Color(0xFFB7F1FF);

  // Red
  Color get red700 => Color(0xFFE32525);

  // Yellow
  Color get yellow800 => Color(0xFFF7941D);
}
