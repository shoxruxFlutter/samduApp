import 'package:flutter/material.dart';

import 'package:samduapp/screens/kafedralar/upload.dart';
import '../../constant.dart';
import '../../models/api_response.dart';
import '../../models/teacher.dart';
import '../../services/teacher_service.dart';
import '../../services/user_service.dart';


class ListKafedralar extends StatefulWidget {
  final String titleKafedra;
  final int kafedraId;

  const ListKafedralar({super.key, required this.titleKafedra, required this.kafedraId});

  @override
  State<ListKafedralar> createState() => _ListKafedralarState();
}

class _ListKafedralarState extends State<ListKafedralar> {

  final List<dynamic> _teacherList = [];

  Future<void> getTeacherAll() async {

  ApiResponse response = await getTeacher(widget.kafedraId);

    if(response.error == null){
      setState(() {       
         for (var element in response.data as List<dynamic>) {
             _teacherList.add(element);            
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
    getTeacherAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
        title: Text(widget.titleKafedra),
        backgroundColor: Colors.blue,
      ),
       body: ListView.builder(
       padding: const EdgeInsets.all(15), 
       itemCount: _teacherList.length,
       itemBuilder: (BuildContext context, int index) { 
        Teacher teacher = _teacherList[index];
        print(teacher);
        return ExpansionTile(         
        title: Text(teacher.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),       
        children:  [
          ListTile(
            title: const Text("O'quv reja"),
             onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Upload(titleFile: "O'quv Reja")));},
            ),
          ListTile(title: Text(teacher.name),  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Upload(titleFile: 'download',)));},)
        ], 
        );}
      ),      
    );
  }
}
