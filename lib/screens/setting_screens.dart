import 'package:samduapp/pages/profile_page.dart';
import 'package:samduapp/themes/Themes.dart';
import 'package:samduapp/widgets/help_center.dart';
import 'package:samduapp/widgets/profile.dart';
import 'package:samduapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ionicons/ionicons.dart';
import 'package:samduapp/screens/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:samduapp/models/ThemeNotifier.dart';
import 'package:provider/provider.dart';
import 'package:samduapp/widgets/modeee.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({key});
  
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  late ThemeData _selectedTheme;

  // dynamic help() {
  //   // runApp(MaterialPageRoute(builder: (context) => const HelpCenter()));
  //   runApp(HelpCenter());
  // }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    setState(() {});
  }

  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(children: [
            Row(
              children: [
                 
                 
                  Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue,
                  ),
                  child: const Icon(
                    Ionicons.settings_outline,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                const Text("Settings",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Spacer(),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                      icon: const Icon(Icons.chevron_right_outlined),
                      color: Color.fromARGB(255, 31, 30, 30),
                      onPressed: () async {
                        WidgetsFlutterBinding
                            .ensureInitialized(); //required to use platform channels to call native code.
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        bool themeBool = prefs.getBool("isDark") ?? false;

                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MainWidget99(),
                        ));
                      }),
                  // child: const Icon(Ionicons.chevron_forward_outline),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 8, 184, 146),
                  ),
                  child: const Icon(
                    Ionicons.person,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                const Text("Profil",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Spacer(),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.chevron_right_outlined),
                    color: Color.fromARGB(255, 31, 30, 30),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MaterialApp(
                                title: 'User Profile',
                                debugShowCheckedModeBanner: false,

                                // theme: ThemeData(

                                //     primaryColor: Colors.black,
                                //     fontFamily: 'Roboto',
                                //     elevatedButtonTheme:
                                //         ElevatedButtonThemeData(
                                //             style: ElevatedButton.styleFrom(
                                //                 primary: Colors.black,
                                //                 shadowColor: Colors.grey,
                                //                 elevation: 20,
                                //                 shape: RoundedRectangleBorder(
                                //                     borderRadius:
                                //                         BorderRadius.all(
                                //                             Radius.circular(
                                //                                 0.0))))),
                                //     inputDecorationTheme: InputDecorationTheme(
                                //         border: OutlineInputBorder(
                                //             borderRadius:
                                //                 BorderRadius.circular(0.0))),
                                //     textButtonTheme: TextButtonThemeData(
                                //       style: TextButton.styleFrom(
                                //         alignment: Alignment.centerLeft,
                                //         primary: Colors.black,
                                //       ),
                                //     )),
                                theme: context.watch<ThemeProvider>().getTheme,
                                home: ProfilePage(),
                              )));
                    },
                  ),
                  // child: const Icon(Ionicons.chevron_forward_outline),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 209, 154, 4),
                  ),
                  child: const Icon(
                    Ionicons.newspaper_outline,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                const Text("News",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Spacer(),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.chevron_right_outlined),
                    color: Color.fromARGB(255, 31, 30, 30),
                    onPressed: () {},
                  ),
                  // child: const Icon(Ionicons.chevron_forward_outline),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 6, 216, 231),
                  ),
                  child: const Icon(
                    Ionicons.help_circle_outline,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                const Text("Help center",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Spacer(),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.chevron_right_outlined),
                    color: Color.fromARGB(255, 31, 30, 30),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HelpCenter()));
                    },
                  ),
                  // child: const Icon(Ionicons.chevron_forward_outline),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}