// Bu sınıf, SharedPreferences kullanarak uygulama içinde kalıcı veri depolamayı sağlar.
// Özellikle tema verilerini kaydetmek ve geri almak için kullanılır.

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  // SharedPreferences örneği burada saklanır.
  static SharedPreferences? _sharedPreferences;

  // PrefUtils yapıcısı, SharedPreferences'ı başlatır.
  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  // SharedPreferences'ı başlatan ve kullanıma hazır hale getiren metot.
  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print("SharedPreferences Initialized");
  }

  // SharedPreferences içindeki tüm verileri temizleyen metot.
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  // Tema verisini SharedPreferences'a kaydeden metot.
  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  // Tema verisini döndüren metot. Eğer kayıtlı veri yoksa varsayılan olarak 'primary' döner.
  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary'; // Eğer bir hata oluşursa veya veri bulunamazsa 'primary' döner.
    }
  }
}
