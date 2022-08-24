import 'package:flutter/material.dart';
import '../../../../main.dart';
import '../../ui/pages/main_page/main_page.dart';
import '../../ui/pages/splash_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (ctx) => const MyApp(),
  SplashPage.routeName: (ctx) => const SplashPage(),
  MainPage.routeName: (ctx) => const MainPage(),
  // SettingPage.routeName: (ctx) => const SettingPage(),

  // user pages
};
