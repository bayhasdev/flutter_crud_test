import 'package:flutter/material.dart';

class ArrowWidget extends StatelessWidget {
  final Color color;
  final double size;
  const ArrowWidget({this.color = Colors.grey, this.size = 24});

  static IconData getArrowIconData() {
    return Icons.arrow_back_ios_new;
  }

  @override
  Widget build(BuildContext context) {
    return Icon(ArrowWidget.getArrowIconData(), color: color, size: size);
  }
}
