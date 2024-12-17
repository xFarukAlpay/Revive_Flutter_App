// Bu dosya, Flutter projesinde çoklu dil desteği sağlamak için kullanılan bir yerelleştirme (localization) mekanizmasını içerir.
// Yerelleştirme ile uygulamanın farklı dillerde çalışmasını sağlayabiliriz.

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../core/app_export.dart';
import 'en_us/en_us_translations.dart';

// Bu uzantı (extension), String veri tipine yerelleştirilmiş metinleri getirebilme özelliği kazandırır.
extension LocalizationExtension on String {
  // `tr` ile metni yerelleştirilmiş bir metne çevirir.
  String get tr => AppLocalization.of().getString(this);
}

// ignore_for_file: must_be_immutable
// Bu sınıf, uygulama içi yerelleştirmeyi yönetir.
class AppLocalization {
  AppLocalization(this.locale);

  // Mevcut dil bilgisi için Locale nesnesi.
  Locale locale;

  // Yerelleştirilmiş metinlerin tutulduğu harita. Şu an sadece İngilizce desteği var.
  static final Map<String, Map<String, String>> _localizedValues = {'en': enUs};

  // Geçerli yerelleştirme bilgisini alır.
  static AppLocalization of() {
    return Localizations.of<AppLocalization>(
        NavigatorService.navigatorKey.currentContext!, AppLocalization)!;
  }

  // Desteklenen dilleri döner.
  static List<String> languages() => _localizedValues.keys.toList();

  // Verilen metni, mevcut dile uygun şekilde yerelleştirilmiş karşılığını döner.
  // Eğer metin yerelleştirilmemişse, orijinal metin döner.
  String getString(String text) =>
      _localizedValues[locale.languageCode]![text] ?? text;
}

// Bu sınıf, yerelleştirme sağlayıcısını yönetir. Uygulama yerelleştirme için bu sınıfı kullanır.
class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  // Desteklenen dillerde olup olmadığını kontrol eder.
  @override
  bool isSupported(Locale locale) =>
      AppLocalization.languages().contains(locale.languageCode);

  // SynchronousFuture döndürerek dil yüklemesini eşzamanlı olarak yapar.
  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(AppLocalization(locale));
  }

  // Yerelleştirme sağlayıcısının yeniden yüklenmesine gerek olup olmadığını belirtir.
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}

// Bu yerelleştirme sistemi, uygulamanın farklı dillerde çalışmasını sağlar.
// `AppLocalizationDelegate` sınıfı, desteklenen dillerde doğru yerelleştirmeyi sağlar.
// `AppLocalization` sınıfı ise yerelleştirilmiş metinlerin alınmasını ve yönetilmesini gerçekleştirir.
