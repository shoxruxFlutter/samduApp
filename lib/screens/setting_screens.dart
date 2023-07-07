// ignore_for_file: use_build_context_synchronously

import 'package:samduapp/pages/profile_page.dart';
import 'package:samduapp/widgets/help_center.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:samduapp/models/ThemeNotifier.dart';
import 'package:provider/provider.dart';
import 'package:samduapp/widgets/modeee.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});


  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  // dynamic help() {
  //   // runApp(MaterialPageRoute(builder: (context) => const HelpCenter()));
  //   runApp(HelpCenter());
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                      color: const Color.fromARGB(255, 31, 30, 30),
                      onPressed: () async {
                        WidgetsFlutterBinding
                            .ensureInitialized(); //required to use platform channels to call native code.
                        // ignore: unused_local_variable
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MainWidget99(),
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
                    color: const Color.fromARGB(255, 8, 184, 146),
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
                    color: const Color.fromARGB(255, 31, 30, 30),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MaterialApp(
                                title: 'User Profile',
                                debugShowCheckedModeBanner: false,
                                theme: context.watch<ThemeProvider>().getTheme,
                                home: const ProfilePage(),
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
                    color: const Color.fromARGB(255, 209, 154, 4),
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
                    color: const Color.fromARGB(255, 31, 30, 30),
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
                    color: const Color.fromARGB(255, 6, 216, 231),
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
                    color: const Color.fromARGB(255, 31, 30, 30),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HelpCenter()));
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
