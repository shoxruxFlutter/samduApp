// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';



class MyApp123 extends StatelessWidget {
  const MyApp123({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      title: 'Flutter Demo',
      theme:   ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:   const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title=''}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() =>   _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFF26CBE6),
            Color(0xFF26CBC0),
          ], begin: Alignment.topCenter, end: Alignment.center)),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: height / 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage:
                            const AssetImage('assets/profile_img.jpeg'),
                        radius: height / 10,
                      ),
                      SizedBox(
                        height: height / 30,
                      ),
                      const Text(
                        'Sadiq Mehdi',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 2.2),
                child: Container(
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: height / 2.6,
                    left: width / 20,
                    right: width / 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                blurRadius: 2.0,
                                offset:   Offset(0.0, 2.0))
                          ]),
                      child: Padding(
                        padding: EdgeInsets.all(width / 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              headerChild('Photos', 114),
                              headerChild('Followers', 1205),
                              headerChild('Following', 360),
                            ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height / 20),
                      child:   Column(
                        children: <Widget>[
                          infoChild(
                              width, Icons.email, 'zulfiqar108@gmail.com'),
                          infoChild(width, Icons.call, '+12-1234567890'),
                          infoChild(
                              width, Icons.group_add, 'Add to group'),
                          infoChild(width, Icons.chat_bubble,
                              'Show all comments'),
                            Padding(
                            padding:   EdgeInsets.only(top: height / 30),
                            child:   Container(
                              width: width / 3,
                              height: height / 20,
                              decoration:   BoxDecoration(
                                  color: const Color(0xFF26CBE6),
                                  borderRadius:   BorderRadius.all(
                                        Radius.circular(height / 40)),
                                  boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black87,
                                        blurRadius: 2.0,
                                        offset:   Offset(0.0, 1.0))
                                  ]),
                              child:   const Center(
                                child:   Text('FOLLOW ME',
                                    style:   TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget headerChild(String header, int value) =>   Expanded(
          child:   Column(
        children: <Widget>[
            Text(header),
            const SizedBox(
            height: 8.0,
          ),
            Text(
            '$value',
            style:   const TextStyle(
                fontSize: 14.0,
                color: Color(0xFF26CBE6),
                fontWeight: FontWeight.bold),
          )
        ],
      ));

  Widget infoChild(double width, IconData icon, data) =>   Padding(
        padding:   const EdgeInsets.only(bottom: 8.0),
        child:   InkWell(
          child:   Row(
            children: <Widget>[
                SizedBox(
                width: width / 10,
              ),
                Icon(
                icon,
                color: const Color(0xFF26CBE6),
                size: 36.0,
              ),
                SizedBox(
                width: width / 20,
              ),
                Text(data)
            ],
          ),
          onTap: () {

          },
        ),
      );
}