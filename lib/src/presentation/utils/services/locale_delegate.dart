import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../../../generated/locale_base.dart';
import '../../../core/utils/global_var.dart';

class LocalDelegate extends LocalizationsDelegate<LocaleBase> {
  const LocalDelegate();
  static const idMap = {
    'ar': 'locales/ar.json',
    'en': 'locales/en.json',
  };

  static const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    LocalDelegate(),
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  // Returns a locale which will be used by the app
  static Locale? localeResolutionCallback(Locale? local, Iterable<Locale> supportedLocales) {
    return supportedLocales.first;
  }

  // List all of the app's supported locales here
  static const supportedLocales = [
    Locale('ar'),
    Locale('en'),
  ];

  @override
  bool isSupported(Locale locale) => ['ar', 'en'].contains(locale.languageCode);

  @override
  Future<LocaleBase> load(Locale locale) async {
    var lang = 'ar';
    if (isSupported(locale)) lang = locale.languageCode;
    final loc = LocaleBase();
    try {
      await loc.load(idMap[lang] ?? lang);
    } catch (err) {
      GlobalVar.log(err.toString());
      lang = 'ar';
      await loc.load(idMap[lang] ?? lang);
    }
    return loc;
  }

  @override
  bool shouldReload(LocalDelegate old) => true;
}
