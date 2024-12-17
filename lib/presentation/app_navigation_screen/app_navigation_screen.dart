// Bu dosya, uygulamanın farklı ekranlarına yönlendirme sağlayan bir widget olan 'AppNavigationScreen'i içerir.
// Ekranın üst kısmında "App Navigation" başlıklı bir bölüm ve altında uygulamanın farklı ekranlarına gitmeyi sağlayan butonlar bulunur.

import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'bloc/app_navigation_bloc.dart';
import 'models/app_navigation_model.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key}) : super(key: key);

  // 'builder' metodu, bu widget'ı bir BlocProvider ile sarmalar.
  // Bu, navigasyon durumu için gerekli BLoC yapılandırmasını sağlar.
  static Widget builder(BuildContext context) {
    return BlocProvider<AppNavigationBloc>(
      create: (context) => AppNavigationBloc(
        AppNavigationState(appNavigationModelObj: AppNavigationModel()),
      )..add(AppNavigationInitialEvent()), // Başlangıç olayı tetiklenir.
      child: AppNavigationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // BlocBuilder, uygulamanın durumuna göre kullanıcı arayüzünü günceller.
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xFFFFFFFF),
            body: SizedBox(
              width: 375.h,
              child: Column(
                children: [
                  // Başlık kısmını içeren Container
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.h),
                          child: const Text(
                            "App Navigation",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 20.5,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Divider(
                          height: 1.h,
                          thickness: 1.h,
                          color: const Color(0xFF000000),
                        ),
                      ],
                    ),
                  ),
                  // Ana içerik bölümü
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFF000000),
                        ),
                        child: Column(
                          children: [
                            // Ekran başlıklarını oluşturmak için kullanılan widgetlar
                            _buildScreenTitle(
                              context,
                              screenTitle: "Giriş Ekranı",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.giriEkranScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Login Ekranı",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.loginEkranScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Signup Ekranı",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.signupEkranScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Profil",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.profilScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "İlan",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.ilanScreen),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Ekran başlıklarını oluşturan yardımcı metod
  Widget _buildScreenTitle(
      BuildContext context, {
        required String screenTitle, // Ekran başlığı
        Function? onTapScreenTitle, // Başlığa tıklandığında çalışacak fonksiyon
      }) {
    return GestureDetector(
      // Tıklandığında, ilgili fonksiyon çağrılır.
      onTap: () {
        onTapScreenTitle?.call();
      },
      child: Column(
        children: [
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Text(
              screenTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 20.fSize,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Divider(
            height: 1.h,
            thickness: 1.h,
            color: Color(0xFF000000),
          ),
        ],
      ),
    );
  }

  // Ekran başlıklarına tıklandığında ilgili rotaya yönlendiren fonksiyon.
  void onTapScreenTitle(String routeName){
    NavigatorService.pushNamed(routeName);
  }
}
