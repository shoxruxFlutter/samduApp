import 'package:flutter/material.dart';
import 'package:samduapp/domain/factories/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const loaderWidget = '/';
  static const login = '/login';
  static const registration = '/registration';
  static const mainScreen = '/main_screen';
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

  static void resetNavigation(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        MainNavigationRouteNames.loaderWidget, (route) => false);
  }
}
