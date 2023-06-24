// import 'dart:html';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
//eski kod
import 'package:samduapp/models/ThemeNotifier.dart';
import 'package:samduapp/screens/setting_screens.dart';
import 'package:samduapp/widgets/modeee.dart';
import 'package:flutter/material.dart';
import 'package:samduapp/pages/profile_page.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HelpCenter extends StatelessWidget {
  // This widget is
  //the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // eski kod
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      theme: context.watch<ThemeProvider>().getTheme,
      home: MyHomePage0(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage0 extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage0> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        
        // leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),
        // onPressed: () => Navigator.of(context).pop(),),
        title: Center(child: Text('Help Center')),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        // heightFactor: 3,
        // widthFactor: 0.8,
        child: Center(
          child: Container(
            // color: Color.fromARGB(255, 41, 40, 40),
            child: Column(
              
              children: [
                const SizedBox(height: 20),
                Container(
                  
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 8, 175, 197),
                  ),
                  child: const Icon(
                    Ionicons.help_buoy,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 10),
                
                Center(
                    child: Text(
                  "Yordam markaziga qo'ng'iroq qilish uchun ",
                  style: TextStyle(color: Color.fromARGB(255, 43, 41, 41)),
                )),

                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () async {
                    Uri phoneno = Uri.parse('tel:+998997898989');
                    if (await launchUrl(phoneno)) {
                      //dialer opened
                    } else {
                      //dailer is not opened
                    }
                  },
                  child: Text(
                    "1020",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        ),
                        
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 248, 248, 248),
                      fixedSize: Size(455, 5)),
                ),
                // UrlLauncher.launch('tel: xxxxxxxx');

                const SizedBox(
                  height: 5,
                ),
                const Text("Yordam Markazi",
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),

                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () async {
                    Uri phoneno = Uri.parse('tel:+998778894563');
                    if (await launchUrl(phoneno)) {
                      //dialer opened
                    } else {
                      //dailer is not opened
                    }
                  },
                  child: Text(
                    "5363",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 248, 248, 248),
                      fixedSize: Size(455, 5)),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("Operator bilan bog'laning",
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
