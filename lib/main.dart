import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:tadbir_landing_page/app_theme.dart' as app_theme;
import 'package:tadbir_landing_page/services/app_route_name.dart';
import 'package:tadbir_landing_page/services/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB4zyOLP11tyur4H3rO0a_9S7iGuZDhC5Y",
          authDomain: "tadbeer-app.firebaseapp.com",
          databaseURL: "https://tadbeer-app-default-rtdb.firebaseio.com",
          projectId: "tadbeer-app",
          storageBucket: "tadbeer-app.appspot.com",
          messagingSenderId: "972476810015",
          appId: "1:972476810015:web:529b2cb861240977f4662a"));
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: app_theme.lightThemeData,
      title: 'My Backyard',
      onGenerateRoute: AppRouter().onGenerateRoute,
      initialRoute: AppRouteName.HOMEPAGE_ROUTE,
    );
  }
}
