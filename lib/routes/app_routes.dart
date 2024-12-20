import 'package:flutter/material.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/giri_ekran_screen/giri_ekran_screen.dart';
import '../presentation/ilan_screen/ilan_screen.dart';
import '../presentation/login_ekran_screen/login_ekrann_screen.dart';
import '../presentation/profil_screen/profil_screen.dart';
import '../presentation/signup_ekran_screen/signup_ekran_screen.dart';
import '../presentation/ilan_ver/ilan_ver_screen.dart';
import '../presentation/ilan_ver_detail/ilan_ver_detail_screen.dart';
import '../presentation/ilan_ver_shared/ilan_ver_shared_screen.dart';

class AppRoutes{
  static const String giriEkranScreen = 'giri_ekran_screen';

  static const String loginEkranScreen = 'login_ekran_screen';

  static const String signupEkranScreen = 'signup_ekran_screen';

  static const String profilScreen = '/profil_screen';

  static const String ProfilInitialPage = '/profil_initial_page';

  static const String ilanScreen = '/ilan_screen';

  static const String ilanVer = '/ilan_ver';
  static const String ilanVerDetail = '/ilan_ver_detail';
  static const String ilanVerShared = '/ilan_ver_shared';



  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
    giriEkranScreen: GiriEkranScreen.builder,
    loginEkranScreen: LoginEkranScreen.builder,
    signupEkranScreen: SignupEkranScreen.builder,
    profilScreen: ProfilScreen.builder,
    ilanScreen: IlanScreen.builder,
    ilanVer: IlanVerScreen.builder,
    ilanVerDetail: IlanVerDetailScreen.builder, // Hata burada düzeltildi
    ilanVerShared: IlanVerSharedScreen.builder, // Hata burada düzeltildi
    appNavigationScreen: AppNavigationScreen.builder,
    initialRoute: GiriEkranScreen.builder,
  };}
