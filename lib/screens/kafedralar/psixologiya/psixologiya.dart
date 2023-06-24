import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:samduapp/screens/kafedralar/psixologiya/nazariya.dart';
import 'package:samduapp/screens/kafedralar/psixologiya/sotsiologiya.dart';
import 'package:samduapp/screens/kafedralar/psixologiya/umumiy.dart';

class Psixologiya extends StatefulWidget {
  const Psixologiya({super.key});

  @override
  State<Psixologiya> createState() => _PsixologiyaState();
}

class _PsixologiyaState extends State<Psixologiya> {

    List<Widget> page = [
    const Nazariya(),
    const Umumiy(),
    const Sotsiologiya(),
  ];
  
  var services = [
    'Psixologiya nazariyasi va amaliyoti kafedrasi',
    'Umumiy psixologiya kafedrasi',
    'Sotsiologiya va ijtimoiy ish kafedrasi',
  ];

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text("Psixologiya va ijtimoiy munosabatlar fakulteti kafedralari"),
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