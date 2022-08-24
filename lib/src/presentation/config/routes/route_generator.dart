import 'package:flutter/material.dart';
import 'package:flutter_crud_test/src/presentation/ui/pages/single_employee/single_employee_page.dart';
import '../../../core/utils/global_var.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed

    GlobalVar.log('settings.name:${settings.name}');

    switch (settings.name) {

      ///
      ///
      // ////////////////{ pages  } ////////////////
      case SingleEmployeePage.routeName:
        return _navigateTo(settings, SingleEmployeePage());
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
