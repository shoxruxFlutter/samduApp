import 'package:flutter/material.dart';
import 'package:samduapp/domain/services/auth_services.dart';
import 'package:samduapp/ui/navigation/main_navigation.dart';

class LoaderViewModel {
  final BuildContext context;
  final _authService = AuthService();

  LoaderViewModel(this.context) {
    asyncInit();
  }

  Future<void> asyncInit() async {
    await checkAuth();
  }

  Future<void> checkAuth() async {
    final isAuth = await _authService.isAuth();
    final nextScreen = isAuth
        ? MainNavigationRouteNames.mainScreen
        : MainNavigationRouteNames.login;
    Navigator.of(context).pushReplacementNamed(nextScreen);
  }
}
