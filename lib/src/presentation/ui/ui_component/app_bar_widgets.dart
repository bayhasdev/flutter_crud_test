import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../config/themes/colors.dart';

PreferredSizeWidget customAppBar(
  BuildContext context,
  String title, {
  Color? backgroundcolor = kCardBackground,
  Color? color = Colors.black,
  List<Widget>? actions,
  bool centerTitle = true,
}) {
  var titleTextStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
        color: color,
        fontWeight: FontWeight.bold,
      );
  return AppBar(
    leading: BackButtonWidget(color: color),
    title: Text(title, style: titleTextStyle),
    centerTitle: centerTitle,
    backgroundColor: backgroundcolor,
    actions: actions,
  );
}

class BackButtonWidget extends StatelessWidget {
  final Color? color;
  final Color? backgroundColor; // Colors.black45
  const BackButtonWidget({this.color = Colors.white, this.backgroundColor});
  @override
  Widget build(BuildContext context) {
    if (backgroundColor == null) return _arrow();
    return CircleAvatar(
      backgroundColor: backgroundColor,
      child: _arrow(),
    );
  }

  Widget _arrow() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 3),
      child: CupertinoNavigationBarBackButton(color: color),
    );
  }
}
