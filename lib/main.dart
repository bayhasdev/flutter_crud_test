import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/presentation/ui/pages/splash_page.dart';
import 'src/presentation/ui/ui_component/custom_widget/init_widget.dart';
import 'src/presentation/utils/services/app_global_initializer.dart';
import 'src/presentation/utils/services/locale_delegate.dart';

import 'src/core/constants/constants.dart';
import 'src/core/utils/global_var.dart';
import 'src/presentation/config/routes/route_generator.dart';
import 'src/presentation/config/routes/routes.dart';
import 'src/presentation/config/themes/theme.dart';
import 'src/presentation/utils/extensions/extensions.dart';

void main() async {
  await mainInitializer();
  runApp(const ProviderScope(child: InitWidget(child: AppRootWidget())));
}

class AppRootWidget extends StatelessWidget {
  const AppRootWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GlobalVar.log('**************************************** AppRootWidget.build');
    return MaterialApp(
      title: kAppName,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: LocalDelegate.localizationsDelegates,
      supportedLocales: LocalDelegate.supportedLocales,
      localeResolutionCallback: LocalDelegate.localeResolutionCallback,
      theme: lightTheme,

      // Initially display FirstPage
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      routes: appRoutes,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    str = context.str!;
    return const SplashPage();
    // return GlobalVar.appFirstLunch ? ChangeNotifierProvider(create: (context) => SetupWizardNotifier(),
    // child: SetupWizardPage()) : SplashPage();
  }
}
