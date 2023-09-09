import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samduapp/ui/widgets/account_screen/account_screen_widget.dart';
import 'package:samduapp/ui/widgets/anketa_screen/anketa_screen_widget.dart';
import 'package:samduapp/ui/widgets/auth_screen/login_view_model.dart';
import 'package:samduapp/ui/widgets/auth_screen/login_widget.dart';
import 'package:samduapp/ui/widgets/auth_screen/registration_view_model.dart';
import 'package:samduapp/ui/widgets/auth_screen/registration_widget.dart';
import 'package:samduapp/ui/widgets/loader_screen/loader_view_model.dart';
import 'package:samduapp/ui/widgets/loader_screen/loader_widget.dart';
import 'package:samduapp/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:samduapp/ui/widgets/yuklama_screen/yuklama_screen_widget.dart';
import 'package:samduapp/ui/widgets/yuklama_screen/yuklama_view_model.dart';

class ScreenFactory {
  Widget makeLoader() {
    return Provider(
      create: (context) => LoaderViewModel(context),
      lazy: false,
      child: const LoaderWidget(),
    );
  }

  Widget makeLogin() {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: const LoginWidget(),
    );
  }

  Widget makeRegistration() {
    return ChangeNotifierProvider(
      create: (_) => RegistrationViewModel(),
      child: const RegistrationWidget(),
    );
  }

  Widget makeMainScreen() {
    return const MainScreenWidget();
  }

  Widget makeYuklamaScreen() {
    return ChangeNotifierProvider(
      create: (_) => YuklamaViewModel(),
      child: const YuklamaScreenWidget(),
    );
  }

  Widget makeAnketaScreen() {
    return const AnketaScreenWidget();
  }

  Widget makeAccountScreen() {
    return const AccountScreenWidget();
  }
}
