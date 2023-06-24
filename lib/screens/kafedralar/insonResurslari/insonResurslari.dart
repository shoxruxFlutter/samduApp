import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'raqamli.dart';
import 'resurslar.dart';
import 'tarmoqlar.dart';

class InsonResurslari extends StatefulWidget {
  const InsonResurslari({super.key});

  @override
  State<InsonResurslari> createState() => _InsonResurslariState();
}

class _InsonResurslariState extends State<InsonResurslari> {


   List<Widget> page = [
    const Resurslar(),
    const Raqamli(),
    const Tarmoqlar(),
  ];
  
  var services = [
    'Inson resurslarini boshqarish kafedrasi',
    'Raqamli iqtisodiyot kafedrasi',
    'Tarmoqlar iqtisodiyoti kafedrasi',
  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text("Matematika fakulteti kafedralari"),
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