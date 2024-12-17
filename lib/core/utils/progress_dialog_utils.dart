// Bu sınıf, uygulamada işlem yükü sırasında kullanıcıya gösterilecek bir yükleme (progress) dialogunu yönetir.
// Yükleme ekranını göstermek ve gizlemek için ortak metotlar sağlar.

import 'package:flutter/material.dart';
import 'package:tirloj/core/utils/navigator_service.dart';

class ProgressDialogUtils {
  // Yükleme ekranının şu an görünür olup olmadığını takip eder.
  static bool isProgressVisible = false;

  /// Ortak bir progress dialog gösterme metodu.
  /// [context] parametresi ile diyalog hangi ekranda gösterileceğini belirtir.
  /// [isCancellable] true ise, kullanıcı ekrana dokunarak diyalogu kapatabilir.
  static void showProgressDialog(
      {BuildContext? context, bool isCancellable = false}) async {
    // Eğer progress dialog görünür değilse ve navigator key ile context mevcutsa dialogu gösterir.
    if (!isProgressVisible &&
        NavigatorService.navigatorKey.currentState?.overlay?.context != null) {
      showDialog(
          barrierDismissible: isCancellable, // İptal edilebilirlik durumu.
          context: NavigatorService.navigatorKey.currentState!.overlay!.context,
          builder: (BuildContext context) {
            return Center(
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 4, // Yükleme göstergesinin genişliği.
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.white, // Yükleme göstergesinin rengi.
                ),
              ),
            );
          });
      isProgressVisible = true; // Dialog görünür duruma geçer.
    }
  }

  /// Ortak bir progress dialog gizleme metodu.
  static void hideProgressDialog() {
    // Eğer dialog görünürse, navigator ile kapatılır ve görünürlük false yapılır.
    if (isProgressVisible) {
      Navigator.pop(
          NavigatorService.navigatorKey.currentState!.overlay!.context);
      isProgressVisible = false;
    }
  }
}
