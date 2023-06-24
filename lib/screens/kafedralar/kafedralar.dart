import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:samduapp/services/kafedra_service.dart';

import '../../constant.dart';
import '../../models/api_response.dart';
import '../../models/kafedra.dart';
import '../../services/user_service.dart';
import 'listkafedralar.dart';
import 'matematika/matematika.dart';


class Kafedralar extends StatefulWidget {
   final String screenTitle;
   final int fakultetId;
   final List listKafedra;
   final List kafedraDoc;
  //  final Widget numPage;


const Kafedralar({super.key, required this.screenTitle, required this.listKafedra, required this.kafedraDoc, required this.fakultetId});

  @override
  State<Kafedralar> createState() => _KafedralarState();
}

class _KafedralarState extends State<Kafedralar> {
      List<dynamic> _kafedraList = [];
    // get all fakultet
  Future<void> getKafedraAll() async {
    // userId = await getUserId();

  ApiResponse response = await getKafedra(widget.fakultetId);

    if(response.error == null){

      setState(() {
        

         for (var element in response.data as List<dynamic>) {

              _kafedraList.add(element);
                
        
        }
 

        // _loading = _loading ? !_loading : _loading;
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
                  MaterialPageRoute(builder: (context) => ListKafedralar(titleKafedra: widget.listKafedra[index], doc: widget.kafedraDoc[index], kafedraId: kafedra.id,)),
                  ),
                splashColor: Colors.blue,
                child: 
                  Column(
                    children: <Widget>[
                    const SizedBox(height: 30,),
                    // Image.asset(images[index], height: 64, width: 64,),
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
