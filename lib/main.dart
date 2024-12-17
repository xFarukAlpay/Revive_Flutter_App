// Bu kod, Flutter uygulamasının ana giriş noktasını ve uygulama temasıyla ilgili ayarları içerir.
// Uygulama, portre modunda başlatılır ve tema, kullanıcı tercihlerine göre dinamik olarak güncellenir.
// Ayrıca, yerelleştirme ve navigasyon ayarları yapılandırılmıştır.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/app_export.dart'; // Projeye özgü dosyalar buradan import edilmiş olmalı

// Global bir Messenger anahtarı tanımlanıyor, uygulama içinde mesajları göstermek için kullanılır.
var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  // Flutter widget binding'i başlatılıyor.
  WidgetsFlutterBinding.ensureInitialized();

  // Cihazın sadece portre modunda çalışmasını sağlıyor.
  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  ]).then((value) {
    // Uygulama başlatılıyor.
    runApp(MyApp());
  });
}

// MyApp sınıfı, uygulamanın temel yapı taşı olan widget'ı temsil eder.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sizer widget'i, cihazın boyutuna göre arayüzü ayarlamaya yardımcı olur.
    return Sizer(
      builder: (context, orientation, deviceType) {
        // Tema yönetimi için BlocProvider kullanılıyor, Bloc patterni ile tema durumu yönetiliyor.
        return BlocProvider(
          create: (context) => ThemeBloc(
            ThemeState(
              themeType: PrefUtils().getThemeData(), // PrefUtils, kullanıcı tercihlerini almak için kullanılıyor.
            ),
          ),
          child: BlocBuilder<ThemeBloc, ThemeState>(
            // BlocBuilder, Tema durumuna göre arayüzü yeniden oluşturur.
            builder: (context, state) {
              return MaterialApp(
                theme: theme, // Uygulamanın varsayılan teması.
                title: 'tirloj', // Uygulamanın başlık kısmı.
                navigatorKey: NavigatorService.navigatorKey, // Özel bir navigasyon servisi kullanılıyor.
                debugShowCheckedModeBanner: false, // Debug banner'ı kaldırıldı.

                // Uygulama yerelleştirme ayarları.
                localizationsDelegates: [
                  AppLocalizationDelegate(), // Uygulama için özelleştirilmiş yerelleştirme desteği.
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en', ''), // Desteklenen diller. Şu an sadece İngilizce mevcut.
                ],

                // Uygulamanın başlangıç rotası (giriş ekranı).
                initialRoute: AppRoutes.initialRoute,

                // Uygulamanın yönlendirme sistemi (rotalar).
                routes: AppRoutes.routes, // Uygulama içinde kullanılacak rotalar.
              );
            },
          ),
        );
      },
    );
  }
}
