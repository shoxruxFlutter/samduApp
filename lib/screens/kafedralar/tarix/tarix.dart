import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'arxeologiya.dart';
import 'jahon.dart';
import 'samarqand.dart';
import 'tarixshunoslik.dart';
import 'uzbekiston.dart';

class Tarix extends StatefulWidget {
  const Tarix({super.key});

  @override
  State<Tarix> createState() => _TarixState();
}

class _TarixState extends State<Tarix> {

  
  List<Widget> page = [
    const Uzbekiston(),
    const Arxeologiya(),
    const Jahon(),
    const Tarixshunoslik(),
    const Samarqand(),
  ];
  
  var services = [
    "O'zbekiston tarixi kafedrasi",
    'Arxeologiya kafedrasi',
    'Jahon tarixi kafedrasi',
    'Tarixshunoslik va manbashunoslik kafedrasi',
    'Samarqand tamadduni tarixi',
 ];

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text("Tarix fakulteti kafedralari"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: services.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:1,
            childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height/6.0)
          ),
          itemBuilder: (BuildContext context, int index){
            return Card(
              child: InkWell(
                onTap: ()=> Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page[index]),
                  ),
                splashColor: Colors.blue,
                child: 
                  Column(
                    children: <Widget>[
                    const SizedBox(height: 30,),
                    // Image.asset(images[index], height: 64, width: 64,),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(services[index], style: const TextStyle(fontSize: 16, fontFamily: "Avenir", color: Colors.black, height: 1.2, fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
                    )
                  ]),
              ),
            );
          },
          ),
      ),
  
    );
  
  }
}