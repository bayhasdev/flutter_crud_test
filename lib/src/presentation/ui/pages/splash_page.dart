import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/services/app_global_initializer.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils/global_var.dart';
import 'main_page/main_page.dart';

import '../ui_component/custom_widget/messages.dart';
import '../../utils/extensions/extensions.dart';

class SplashPage extends ConsumerStatefulWidget {
  static const String routeName = '/SplashPage';
  const SplashPage({Key? key}) : super(key: key);
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
    initAppState();
  }

  void initAppState() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      try {
        await appLoadMainData(ref);
        if (!mounted) return;
        context.pushReplacementNamed(MainPage.routeName);
      } catch (err) {
        showDialog(
          context: context,
          builder: (context) => CustomDialog(
            message: err.toString(),
            actions: <Widget>[
              TextButton(child: Text(str.main.cancel), onPressed: () => Navigator.pop(context)),
              TextButton(
                child: Text(str.main.retry),
                onPressed: () {
                  Navigator.pop(context);
                  initAppState();
                },
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(kLogo),
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }
}
