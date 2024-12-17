import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'bloc/profil_bloc.dart';
import 'models/profil_model.dart';
import 'profil_initial_page.dart';

class ProfilScreen extends StatelessWidget {
  ProfilScreen({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> navigatorkey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<ProfilBloc>(
      create: (context) => ProfilBloc(ProfilState(profilModelObj: ProfilModel()))
        ..add(ProfilInitialEvent()),
      child: ProfilScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Navigator(
          key: navigatorkey,
          initialRoute: AppRoutes.ProfilInitialPage,
          onGenerateRoute: (routeSettings) => PageRouteBuilder(
            pageBuilder: (ctx, ani, ani1) =>
                getCurrentPage(context, routeSettings.name!),
            transitionDuration: const Duration(seconds: 0),
          ),
        ),
        bottomNavigationBar: _buildBottomNavigation(context),
      ),
    );
  }

  /// Bottom Navigation Bar Widget
  Widget _buildBottomNavigation(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
          navigatorkey.currentContext!,
          getCurrentRoute(type),
        );
      },
    );
  }

  /// Determine the route based on bottom navigation selection
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Anasayfa:
        return AppRoutes.ProfilInitialPage;
      case BottomBarEnum.Lanlar:
      case BottomBarEnum.Profile:
      case BottomBarEnum.Sohbetler:
        return "/";
      default:
        return "/";
    }
  }

  /// Return the current page based on the route
  Widget getCurrentPage(BuildContext context, String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.ProfilInitialPage:
        return ProfilInitialPage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
