import 'dart:io';

import 'package:flutter/material.dart';
import 'package:samduapp/screens/kafedralar/download.dart';
import 'package:samduapp/screens/kafedralar/upload.dart';

import '../../constant.dart';
import '../../models/api_response.dart';
import '../../models/teacher.dart';
import '../../services/teacher_service.dart';
import '../../services/user_service.dart';


class ListKafedralar extends StatefulWidget {
  final String titleKafedra;
  final int kafedraId;
  final List doc;
  const ListKafedralar({super.key, required this.titleKafedra, required this.doc, required this.kafedraId});

  @override
  State<ListKafedralar> createState() => _ListKafedralarState();
}

class _ListKafedralarState extends State<ListKafedralar> {

  final List<dynamic> _teacherList = [];

  Future<void> getTeacherAll() async {
    // userId = await getUserId();

  ApiResponse response = await getTeacher(widget.kafedraId);

    if(response.error == null){

      setState(() {
        

         for (var element in response.data as List<dynamic>) {

              _teacherList.add(element);
                
        
        }
        print(_teacherList.length);

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
    getTeacherAll();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    bool _customIcon = false;
  
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
          ListTile(title: Text(teacher.name),  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const downloadFilee()));},)
        ],
     

        );}
      ),
      
    );
  }
}

// class Entry {
//   final String title;
//   final List<Entry>
//       children; // Since this is an expansion list ...children can be another list of entries
//   Entry(this.title, [this.children = const <Entry>[]]);

  
// }
 
// // This is the entire multi-level list displayed by this app





 
// // Create the Widget for the row
// class EntryItem extends StatelessWidget {
//   const EntryItem(this.entry, {super.key});
//   final Entry entry;
 
//   // This function recursively creates the multi-level list rows.
//   Widget _buildTiles(Entry root) {
//     if (root.children.isEmpty) {
//       return ListTile(
//         title: Text(root.title,  style: const TextStyle( fontSize: 16, fontFamily: "Avenir", color: Colors.black87)),
//       );
//     }
//     return ExpansionTile(
//       key: PageStorageKey<Entry>(root),
//       title: Text(root.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontFamily: "Avenir", color: Colors.black)),
//       children: root.children.map<Widget>(_buildTiles).toList(),
//     );
//   }
 
//   @override
//   Widget build(BuildContext context) {
//     return _buildTiles(entry);
//   }
// }