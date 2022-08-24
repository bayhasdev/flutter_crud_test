import 'package:flutter/material.dart';
import '../../../core/utils/global_var.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    GlobalVar.log('settings.name:${settings.name}');

    switch (settings.name) {

      ///
      ///
      // ////////////////{ pages  } ////////////////
      // case PhoneCodePage.routeName:
      //   return _navigateTo(settings, PhoneCodePage(args as PhoneNumberModel));

    } // If there is no such named route in the switch statement, e.g. /third
    return _errorRoute();
  }

  static Route<dynamic> _navigateTo(RouteSettings settings, Widget page) {
    return MaterialPageRoute(builder: (_) => page, settings: settings);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(appBar: AppBar(title: const Text('Error!')), body: const Center(child: Text('Route Page Error')));
    });
  }
}
