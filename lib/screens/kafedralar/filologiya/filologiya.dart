import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'adabiyot.dart';
import 'ingliz.dart';
import 'istiqlol.dart';
import 'mumtoz.dart';
import 'roman.dart';
import 'rus.dart';
import 'tilshunoslik.dart';
import 'tojik.dart';

class Filologiya extends StatefulWidget {
  const Filologiya({super.key});

  @override
  State<Filologiya> createState() => _FilologiyaState();
}

class _FilologiyaState extends State<Filologiya> {

    List<Widget> page = [
    const Mumtoz(),
    const Tilshunoslik(),
    const Istiqlol(),
    const Adabiyot(),
    const Tojik(),
    const Rus(),
    const Ingliz(),
    const Roman(),
  ];
  
  var services = [
    'Mumtoz adabiyot tarixi kafedrasi',
    "O‘zbek tilshunosligi kafedrasi",
    'Istiqlol davri adabiyoti va adabiyot nazariyasi kafedrasi',
    "O‘zbek tili va adabiyoti kafedrasi",
    'Tojik filologiyasi va xorijiy sharq tillari',
    'Rus filologiyasi',
    'Ingliz tili',
    'Roman-german tillari',

  ];

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text("Filologiya fakulteti kafedralari"),
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