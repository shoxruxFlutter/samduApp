import 'package:flutter/material.dart';
import 'package:samduapp/ui/navigation/main_navigation.dart';

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Samdu Mobile Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: mainNavigation.routes,
      initialRoute: MainNavigationRouteNames.loaderWidget,
    );
  }
}
