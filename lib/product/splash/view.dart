import 'package:flutter/material.dart';

import '../../core/base/navigation/service.dart';
import '../../core/base/state/state.dart';
import '../../core/base/state/view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends BaseState<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) => NavigationService.instance.navigateToPage(path: NavigationPaths.home));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      scaffoldBackgroundColor: colors.lightPurple,
      body: Center(child: Image.asset("assets/icons/eden.png", height: 250)),
    );
  }
}
