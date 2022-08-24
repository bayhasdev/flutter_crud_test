import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main_page_provider.dart';

final mainPageProvider = ChangeNotifierProvider<MainPageProvider>((ref) {
  return MainPageProvider();
});

class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String routeName = '/MainPage';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  late MainPageProvider provider;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider = ref.watch(mainPageProvider);
    return Scaffold(
      appBar: _appBar(context),
      body: _body(),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(provider.pageTitle),
    );
  }

  ListView _body() {
    return ListView(
      children: const [],
    );
  }
}
