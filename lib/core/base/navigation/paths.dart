import 'package:flutter/cupertino.dart';
import 'package:womanaiapp/core/base/navigation/service.dart';
import 'package:womanaiapp/product/chatting/chat_view.dart';
import 'package:womanaiapp/product/suggestion/suggestion_page.dart';
import 'package:womanaiapp/product/voice_chat.dart';

import '../../../product/home/home_view.dart';
import '../../../product/splash/view.dart';

class NavigationRoute {
  static NavigationRoute? _instance;
  static NavigationRoute get instance {
    _instance ??= NavigationRoute._init();
    return _instance!;
  }

  NavigationRoute._init();

  Route generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationPaths.home:
        return normalNavigate(const HomeView());
      case NavigationPaths.chat:
        Map<String, dynamic>? arguments = args.arguments as Map<String, dynamic>;
        String? text = arguments["text"];
        return normalNavigate(ChatPage(initialMessage: text));
      case NavigationPaths.sug:
        Map<String, dynamic> arguments = args.arguments as Map<String, dynamic>;
        List<String>? texts = arguments["text"];
        return normalNavigate(SugPage(textSuggestions: texts ?? []));
      case NavigationPaths.voice:
        return normalNavigate(ChatScreen());
      default:
        return normalNavigate(const SplashView());
    }
  }

  PageRoute normalNavigate(Widget widget) {
    return CupertinoPageRoute(builder: (context) => widget);
  }

  PageRoute normalNavigateToPop(Widget widget) {
    return CupertinoPageRoute(builder: (context) => widget, fullscreenDialog: true);
  }
}
