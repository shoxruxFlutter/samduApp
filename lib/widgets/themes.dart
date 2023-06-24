import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
// import 'package:accaunt/widgets/.dart';
class MyWidget12 extends StatefulWidget {
  const MyWidget12({key});

  @override
  State<MyWidget12> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget12> {
  @override
  bool _iconBool = false;
  IconData _iconLight = Icons.nights_stay;
  IconData _iconDark = Icons.wb_sunny;
  ThemeData _themeLight = ThemeData(
    primaryColor: Colors.amberAccent,
    brightness: Brightness.light,
  );
  ThemeData _themeDark = ThemeData(
    primaryColor: Colors.redAccent,
    brightness: Brightness.dark,
  );
  Widget build(BuildContext context) {
  return MaterialApp(
    theme: _iconBool ? _themeDark : _themeLight,
    home: Scaffold(
      
      appBar: AppBar(
        
        title: Text(_iconBool ? "Dark mode" : "Light mode"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor: Colors.blue,
      ),
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          
          child: Column(children: [
            const SizedBox(height: 40),
                        Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 7, 3, 3),
                    ),
                    child: const Icon(
                      Ionicons.moon_outline,
                      color: Colors.white,
                    
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text("Theme",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Container(
                    child: IconButton(
                          icon: Icon(_iconBool ? _iconDark : _iconLight),
                          onPressed: () {
                            setState(() {
                              _iconBool = !_iconBool;
                            });
                          },
                        )
                  )
                  // @override
                  // Widget build(BuildContext context) {
                  //   return MaterialApp(
                  //     theme: _iconBool ? _themeDark : _themeLight,
                  //     home: Scaffold(
                  //       appBar: AppBar(
                  //         title: Text(_iconBool ? "Dark Mode" : "Light Mode"),
                  //         centerTitle: true,
                  //       ),
                  //       body: Center(
                  //           child: IconButton(
                  //         icon: Icon(_iconBool ? _iconDark : _iconLight),
                  //         onPressed: () {
                  //           setState(() {
                  //             _iconBool = !_iconBool;
                  //           });
                  //         },
                  //       )),
                  //     ),
                  //   );
                  // }
                  // Container(
                  //   width: 50,
                  //   height: 50,
                  //   decoration: BoxDecoration(
                  //     color: Colors.grey.shade200,
                  //     borderRadius: BorderRadius.circular(15),
                  //   ),
                  //   child: IconButton(
                  //     icon: const Icon(Icons.chevron_right_outlined),
                  //     color: Color.fromARGB(255, 31, 30, 30),
                  //     onPressed: () {},
                  //   ),
                  //   // child: const Icon(Ionicons.chevron_forward_outline),
                  // ),
                ],
              ),
            ]),
          ),
        ),
      ),
  );
  }
}
