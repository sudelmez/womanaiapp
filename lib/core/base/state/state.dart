import 'package:flutter/material.dart';

import '../util/color.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  double get deviceHeight => MediaQuery.of(context).size.height;
  double get deviceWidth => MediaQuery.of(context).size.width;
  Size get size => MediaQuery.of(context).size;
  bool isLoading = false;
  final ColorUtil colors = ColorUtil();
  changeLoading() => setState(() => isLoading = !isLoading);
}

abstract class BaseStateless extends StatelessWidget {
  BaseStateless({super.key});
  double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  Size size(BuildContext context) => MediaQuery.of(context).size;
  final ColorUtil colors = ColorUtil();
  final bool isLoading = false;
}
