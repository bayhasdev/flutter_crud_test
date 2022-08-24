import 'package:flutter/material.dart';
import '../../../utils/providers/base_provider.dart';

class MainPageProvider extends BaseProvider {
  Widget homeBody = const SizedBox();
  String pageTitle = '';
  int selectedIndex = 0;

  void drawerHandler(Widget page, String title) {
    homeBody = page;
    pageTitle = title;
  }

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
