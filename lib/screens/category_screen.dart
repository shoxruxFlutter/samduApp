
// ignore_for_file: use_build_context_synchronously

import 'package:samduapp/constant.dart';
import 'package:flutter/material.dart';
import 'package:samduapp/models/api_response.dart';
import 'package:samduapp/models/fakulet.dart';
import 'package:samduapp/screens/kafedralar/kafedralar.dart';

import '../services/fakultet_service.dart';
import '../services/user_service.dart';




class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
    List<dynamic> _fakultetList = [];

    // get all fakultet
  Future<void> getFakultetAll() async {


  ApiResponse response = await getFakultet();

    if(response.error == null){
      setState(() {
        _fakultetList = response.data as List<dynamic>;
      });
    }
    else if (response.error == unauthorized){
      logout().then((value) => {
         Navigator.of(context).pushReplacementNamed('/login')
      });
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${response.error}'),
      ));
    }
  }

var images = [
    "assets/images/mathematics.png",
    "assets/images/biological.png",
    "assets/images/geography.png",
    "assets/images/history.png",
    "assets/images/psychology.png",
    "assets/images/chemistry.png",
    "assets/images/it.png",
    "assets/images/juridical.png",
    "assets/images/philology.png",
    "assets/images/preschool.png",
    "assets/images/sport.png",
    "assets/images/control.png",
  ];


    @override
  void initState() {
    getFakultetAll();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: _fakultetList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height/2.0)
        ),
        itemBuilder: (BuildContext context, int index){
           Fakultet fakultet = _fakultetList[index];
          return Card(
            child: InkWell(
              onTap: ()=> Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Kafedralar(screenTitle: fakultet.title, fakultetId: fakultet.id,)),
                ),
              splashColor: Colors.blue,
              child: 
                Column(
                  children: <Widget>[
                  const SizedBox(height: 10,),
                  Image.asset(images[index], height: 64, width: 64,),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(fakultet.title, style: const TextStyle(fontSize: 16, fontFamily: "Avenir", color: Colors.black, height: 1.2, fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
                  )
                ]),
            ),
          );
        },
        ),
    );
  }
}