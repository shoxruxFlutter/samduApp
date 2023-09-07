import 'package:flutter/material.dart';
import 'package:samduapp/domain/factories/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const loaderWidget = '/';
  static const login = '/login';
  static const registration = '/registration';
  static const mainScreen = '/main_screen';
  static const yuklamaScreen = '/main_screen/yuklama_screen';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();

  final routes = <String, Widget Function(BuildContext context)>{
    MainNavigationRouteNames.loaderWidget: (_) => _screenFactory.makeLoader(),
    MainNavigationRouteNames.login: (_) => _screenFactory.makeLogin(),
    MainNavigationRouteNames.registration: (_) =>
        _screenFactory.makeRegistration(),
    MainNavigationRouteNames.mainScreen: (_) => _screenFactory.makeMainScreen(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.yuklamaScreen:
        final arguments = settings.arguments;
        final userId = arguments is int ? arguments : 0;
        final categoryFile = arguments is String ? arguments : '';
        return MaterialPageRoute(
          builder: (_) =>
              _screenFactory.makeYuklamaScreen(userId, categoryFile),
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }

  static void resetNavigation(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        MainNavigationRouteNames.loaderWidget, (route) => false);
  }
}
