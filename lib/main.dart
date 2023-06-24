import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samduapp/screens/login.dart';
import 'package:samduapp/screens/register.dart';
import 'screens/home.dart';
import 'screens/loading.dart';
import 'package:flutter/services.dart';
// import 'package:samduapp/pages/profile_page.dart';
// import 'package:samduapp/widgets/modeee.dart';
import 'package:samduapp/models/ThemeNotifier.dart';
// import 'package:samduapp/screens/setting_screens.dart';


void main() {
   runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(isDark: false), child: const App()));

  // Handles Status and Nav bar styling/theme
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeProvider>().getTheme,
      routes: {
        '/': (context) => Loading(),
        '/home_screen': (context) => Home(),
        '/register': (context) => Register(),
        '/login': (context) => Login(),
      },
    );
  }
}
