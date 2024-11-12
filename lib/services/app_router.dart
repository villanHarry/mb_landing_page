import 'package:flutter/material.dart';
import 'package:tadbir_landing_page/error_page.dart';
import 'package:tadbir_landing_page/home_page.dart';
import 'package:tadbir_landing_page/privacy_page.dart';
import 'package:tadbir_landing_page/services/app_route_name.dart';
import 'package:tadbir_landing_page/support_page.dart';
import 'package:tadbir_landing_page/term_page.dart';

String route = "";

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    route = routeSettings.name ?? "";
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
          //-------------- Common Navigation Routes ---------------------- //

          // Splash Screen
          case AppRouteName.HOMEPAGE_ROUTE:
            return HomePage();

          case AppRouteName.PRIVACY_ROUTE:
            return PrivacyPage();

          case AppRouteName.TERMS_ROUTE:
            return TermsPage();

          case AppRouteName.SUPPORT_ROUTE:
            return SupportPage();

          default:
            return ErrorPage();
        }
      },
    );
  }
}
