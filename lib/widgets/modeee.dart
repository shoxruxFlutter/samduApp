import 'package:samduapp/screens/setting_screens.dart';
import 'package:samduapp/screens/Home1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:samduapp/models/ThemeNotifier.dart';
import 'package:samduapp/pages/profile_page.dart';


// dynamic solve() async {
//     WidgetsFlutterBinding
//         .ensureInitialized(); //required to use platform channels to call native code.
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool themeBool = prefs.getBool("isDark") ?? false; //null check
//     // print("asfkjba;sf");
//     //  runApp(
//     //   ChangeNotifierProvider(
//     //       create: (BuildContext context) => ThemeProvider(isDark: themeBool),
//     //       child:MainWidget99()),
      
//     // );
//     ChangeNotifierProvider(
//         create: (BuildContext context) => ThemeProvider(isDark: themeBool),
//         );
//     Navigator.of(context).push(
//       MaterialPageRoute(builder: (context) => MainWidget99()),
//     );
//   }

class MainWidget99 extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        title: 'Flutter Theme',
        home: HomeScreen(),
        theme: themeProvider.getTheme,
        debugShowCheckedModeBanner: false,
      );
    });
  }
  
}
