import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:samduapp/screens/kafedralar/kimyo/fizikaviy.dart';
import 'package:samduapp/screens/kafedralar/kimyo/noorganik.dart';
import 'package:samduapp/screens/kafedralar/kimyo/organik.dart';

import 'analitik.dart';
import 'polimerlar.dart';

class Kimyo extends StatefulWidget {
  const Kimyo({super.key});

  @override
  State<Kimyo> createState() => _KimyoState();
}

class _KimyoState extends State<Kimyo> {

    List<Widget> page = [
    const Organik(),
    const Noorganik(),
    const Fizikaviy(),
    const Analitik(),
    const Polimerlar(),
  ];
  
  var services = [
    'Organik sintez va bioorganik kimyo kafedrasi',
    'Noorganik kimyo va materialshunoslik kafedrasi',
    'Fizikaviy va kolloid kimyo kafedrasi',
    'Analitik kimyo kafedrasi',
    'Polimerlar kimyosi va kimyoviy texnologiya',
  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text("Kimyo fakulteti kafedralari"),
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