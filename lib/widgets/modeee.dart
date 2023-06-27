import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samduapp/models/ThemeNotifier.dart';

import '../screens/home.dart';


class MainWidget99 extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        title: 'Flutter Theme',
        home: Home(),
        theme: themeProvider.getTheme,
        debugShowCheckedModeBanner: false,
      );
    });
  }
  
}
