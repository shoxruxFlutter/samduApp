import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:samduapp/screens/kafedralar/it/axborotlashtirish.dart';
import 'package:samduapp/screens/kafedralar/it/dasturlash.dart';
import 'package:samduapp/screens/kafedralar/it/matematik.dart';
import 'package:samduapp/screens/kafedralar/it/optimal.dart';

class It extends StatefulWidget {
  const It({super.key});

  @override
  State<It> createState() => _ItState();
}

class _ItState extends State<It> {

    List<Widget> page = [
    const Matematik(),
    const Optimal(),
    const Axborotlashtirish(),
    const Dasturlash(),

  ];
  
  var services = [
    'Matematik modellashtirish kafedrasi',
    'Optimal boshqaruv metodlari kafedrasi',
    'Axborotlashtirish texnologiyalari kafedrasi',
    'Dasturiy injiniring kafedrasi',
  ];

  @override 
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text("Intellektual tizimlar va kompyuter texnologiyalari fakulteti kafedralari"),
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