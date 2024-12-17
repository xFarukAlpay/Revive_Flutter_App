// Bu kod, ekran boyutuna göre uygulamayı dinamik olarak ölçeklendirmek ve cihaz türüne göre farklı yapılandırmalar sağlamak için kullanılır.
// ResponsiveExtension ile genişlik ve yükseklik ayarlarını yapar, FormatExtension ile sayısal formatları biçimlendirir.
// Ayrıca Sizer widget'ı ve SizeUtils sınıfı ile cihaz boyutlarını belirleyip kullanır.

import 'package:flutter/material.dart';

const num FIGMA_DESIGN_WIDTH = 430; // Tasarımın varsayılan genişliği.
const num FIGMA_DESIGN_HEIGHT = 932; // Tasarımın varsayılan yüksekliği.
const num FIGMA_DESIGN_STATUS_BAR = 0; // Varsayılan durum çubuğu yüksekliği.

// ResponsiveExtension: Ekran boyutlarına göre oranlama işlemleri yapar.
extension ResponsiveExtension on num {
  // Tasarım genişliği baz alınarak genişlik hesaplama.
  double get _width => SizeUtils.width;

  // Yüksekliği FIGMA tasarımına göre oranlar.
  double get h => (this * _width) / FIGMA_DESIGN_WIDTH;

  // Yazı boyutunu FIGMA tasarımına göre oranlar.
  double get fSize => (this * _width) / FIGMA_DESIGN_WIDTH;
}

// FormatExtension: Sayısal değerlerin biçimlendirilmesi için yardımcı metotlar.
extension FormatExtension on double {
  // Ondalık sayıyı belirli bir basamağa yuvarlar.
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(this.toStringAsFixed(fractionDigits));
  }

  // Eğer sayı 0'dan büyükse kendisini, değilse varsayılan değeri döner.
  double isNonZero({num defaultValue = 0.0}) {
    return this > 0 ? this : defaultValue.toDouble();
  }
}

// Cihaz türleri için enum tanımı.
enum DeviceType { mobile, tablet, desktop }

// ResponsiveBuild: Ekran türüne göre yapılandırma sağlayan fonksiyon tipi.
typedef ResponsiveBuild = Widget Function(
    BuildContext context,
    Orientation orientation,
    DeviceType deviceType,
    );

// Sizer widget: Ekran boyutuna göre yapılandırma yapmak için kullanılır.
class Sizer extends StatelessWidget {
  const Sizer({Key? key, required this.builder}) : super(key: key);

  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
              builder: (context, orientation) {
                // Ekran boyutlarını ve cihaz tipini belirler.
                SizeUtils.setScreenSize(constraints, orientation);
                return builder(context, orientation, SizeUtils.deviceType);
              });
        });
  }
}

// SizeUtils sınıfı: Ekran boyutları ve cihaz türünü belirler.
class SizeUtils {
  static late BoxConstraints boxConstraints;

  /// Cihazın yönü (dikey veya yatay).
  static late Orientation orientation;

  /// Cihazın türü (mobil, tablet, vs.).
  static late DeviceType deviceType;

  /// Cihazın yüksekliği.
  static late double height;

  /// Cihazın genişliği.
  static late double width;

  // Ekran boyutlarını ve cihaz türünü ayarlar.
  static void setScreenSize(
      BoxConstraints constraints, Orientation currentOrientation) {
    boxConstraints = constraints;
    orientation = currentOrientation;

    if (orientation == Orientation.portrait) {
      // Eğer cihaz dikey moddaysa genişliği ve yüksekliği belirler.
      width = boxConstraints.maxWidth.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH);
      height = boxConstraints.maxHeight.isNonZero();
    } else {
      // Eğer cihaz yatay moddaysa genişliği ve yüksekliği ters hesaplar.
      width = boxConstraints.maxHeight.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH);
      height = boxConstraints.maxWidth.isNonZero();
    }

    // Varsayılan olarak cihaz türü mobil olarak ayarlanmıştır.
    deviceType = DeviceType.mobile;
  }
}
