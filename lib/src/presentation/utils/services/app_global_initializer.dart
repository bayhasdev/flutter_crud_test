import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
///
///app Global Initialize Functions
Future mainInitializer() async {
  // WidgetsFlutterBinding.ensureInitialized: Ensure that plugin services are initialized
  WidgetsFlutterBinding.ensureInitialized();
}

Future appLoadMainData(WidgetRef ref) async {
  try {
    await Future.wait([]);
  } catch (err) {
    rethrow;
  }
}
