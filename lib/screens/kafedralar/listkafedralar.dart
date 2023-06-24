import 'dart:io';

import 'package:flutter/material.dart';
import 'package:samduapp/screens/kafedralar/download.dart';
import 'package:samduapp/screens/kafedralar/upload.dart';

import 'matematika/matematika.dart';

class ListKafedralar extends StatefulWidget {
  final String titleKafedra;
  final List doc;
  const ListKafedralar({super.key, required this.titleKafedra, required this.doc});

  @override
  State<ListKafedralar> createState() => _ListKafedralarState();
}

class _ListKafedralarState extends State<ListKafedralar> {

  
//   listdoc(){
//   List<Entry> data = [];
//   for (var age in widget.doc) {
//   data.add(
//   Entry(
//     age,
//     <Entry>[
//       Entry("Ilmiy-uslubiy ishlar"),
//        Entry('Yuklamalar',  <Entry>[
//           Entry("O'quv yuklamasi"),
//           Entry("Adabiyotlar ro'yxati")
//         ],
//       )
//     ],
//   ));  
//   }

//   return data;
// }



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
       itemCount: widget.doc.length,
       itemBuilder: (BuildContext context, int index) => ExpansionTile(
        title: Text(widget.doc[index], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
      
        children:  [
          ListTile(
            title: Text("O'quv reja"),
             onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Upload(titleFile: "O'quv Reja")));},
            ),
          ListTile(title: Text("2"),  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const downloadFilee()));},)
        ],
     

        )
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