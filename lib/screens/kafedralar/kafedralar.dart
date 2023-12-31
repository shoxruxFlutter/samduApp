// ignore_for_file: use_build_context_synchronously



import 'package:flutter/material.dart';
import 'package:samduapp/services/kafedra_service.dart';

import '../../constant.dart';
import '../../models/api_response.dart';
import '../../models/kafedra.dart';
import '../../services/user_service.dart';
import 'listkafedralar.dart';


class Kafedralar extends StatefulWidget {
   final String screenTitle;
   final int fakultetId;




const Kafedralar({super.key, required this.screenTitle, required this.fakultetId});

  @override
  State<Kafedralar> createState() => _KafedralarState();
}

class _KafedralarState extends State<Kafedralar> {
      final List<dynamic> _kafedraList = [];

  // get all fakultet
  Future<void> getKafedraAll() async {


  ApiResponse response = await getKafedra(widget.fakultetId);

    if(response.error == null){
      setState(() {
        for (var element in response.data as List<dynamic>) {
            _kafedraList.add(element);             
        }
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

  @override
  void initState() {
    getKafedraAll();
    super.initState();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text(widget.screenTitle),
        backgroundColor: Colors.blue,
      ),
       body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: _kafedraList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:1,
            childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height/6.0)
          ),
          itemBuilder: (BuildContext context, int index){
            Kafedra kafedra = _kafedraList[index];
            return Card(
              child: InkWell(
                onTap: ()=> Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListKafedralar(titleKafedra: kafedra.title, kafedraId: kafedra.id,)),
                  ),
                splashColor: Colors.blue,
                child: 
                  Column(
                    children: <Widget>[
                    const SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(kafedra.title, style: const TextStyle(fontSize: 16, fontFamily: "Avenir", color: Colors.black, height: 1.2, fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
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
