// Bu sınıf, uygulama içinde navigasyon işlemlerini yöneten bir servis sağlar.
// Navigasyon işlemlerini kolaylaştırmak için çeşitli yardımcı fonksiyonlar içerir.

import 'package:flutter/material.dart';

class NavigatorService {
  // GlobalKey ile uygulamanın NavigatorState'ine erişim sağlanır.
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // pushNamed fonksiyonu: Belirli bir rota ismi ve isteğe bağlı argümanlar ile yeni bir sayfa açar.
  static Future<dynamic> pushNamed(
      String routeName, {
        dynamic arguments,
      }) async {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  // goBack fonksiyonu: Mevcut sayfadan geri dönüş yapar.
  static void goBack() {
    return navigatorKey.currentState?.pop();
  }

  // pushNamedAndRemoveUntil fonksiyonu: Belirli bir rota ile yeni bir sayfa açar ve
  // önceki sayfaları belirli bir koşul sağlanana kadar yığından temizler.
  static Future<dynamic> pushNamedAndRemoveUntil(
      String routeName, {
        bool routePredicate = false,
        dynamic arguments,
      }) async {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
        routeName, (route) => routePredicate,
        arguments: arguments);
  }

  // popAndPushNamed fonksiyonu: Mevcut sayfayı kapatır ve yeni bir sayfaya yönlendirir.
  static Future<dynamic> popAndPushNamed(
      String routeName, {
        dynamic arguments,
      }) async {
    return navigatorKey.currentState
        ?.popAndPushNamed(routeName, arguments: arguments);
  }
}
