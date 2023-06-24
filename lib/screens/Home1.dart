import 'package:flutter/material.dart';
import 'package:samduapp/models/ThemeNotifier.dart';
import 'package:samduapp/themes/Themes.dart';
import 'package:provider/provider.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:string_validator/string_validator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
 
class _HomeScreenState extends State<HomeScreen> {
  late ThemeData _selectedTheme;
  @override
  dynamic _obscureText;

  String? _password = '12as23';
  _toggle(String text) {
    if (text == _password) {
      _obscureText = true;
    } else {
      _obscureText = false;
    }
  }

  _solve(String text1) {
    setState(() {
      if (_obscureText) {
        _password = text1;
        // print(_password);
      }
    });
    // setState(() {
    //   print(_password);
    // });
    print(_password);
  }

  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // color: Color.fromARGB(255, 0, 0, 0),
                    color: themeProvider == true ? Colors.white : Colors.black,
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
                Switch(
                    value: themeProvider.getTheme == darkTheme,
                    activeColor: themeProvider.getTheme == darkTheme
                        ? Colors.white
                        : Colors.black,
                    onChanged: (d) {
                      themeProvider.changeTheme();
                      // theme:
                      // ThemeData.dark();
                    })
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Container(
                //   width: 50,
                //   height: 50,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(15),
                //     // color: Color.fromARGB(255, 0, 0, 0),
                //     color:  themeProvider==true ? Colors.white :Colors.black,
                //   ),
                //   child: const Icon(
                //     Ionicons.moon_outline,
                //     color: Colors.white,
                //   ),
                // ),
                // const SizedBox(width: 10),

                Container(
                  width: 345,
                  height: 270,
                  child: ExpansionTile(
                    title: Text("Parolni o'zgartirish"),
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: "Old Password"),
                        keyboardType: TextInputType.text,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                        validator: (String? val) => (val != null ? val : null),
                        // initialValue: _password,
                        onChanged: _toggle,
                        // onChanged: ,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: "New Password"),
                        keyboardType: TextInputType.text,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                        validator: (String? val) => (val != null ? val : null),
                        // initialValue: _password,
                        onChanged: _solve,
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      // ElevatedButton(
                      //   onPressed: _toggle,

                      //   child: const Text(
                      //     'Update',
                      //     style: TextStyle(fontSize: 15),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                // SizedBox(height: 280,),   
                // Text(_obscureText==false ? "siz xato parol kiritdingiz" : ""),
              ],
             
            ),
            SizedBox(height: 10,),   
            Text(_obscureText==false ? "siz xato parol kiritdingiz" : ""),
          ]),
        ),
      ),
    );
  }
}
