import 'package:flutter/material.dart';


// import 'botanika.dart';
// import 'zoologiya.dart';
// import 'mikrobiologiya.dart';
// import 'biokimyo.dart';
// import 'genetika.dart';

class Biologiya extends StatefulWidget {
  const Biologiya({super.key});

  @override
  State<Biologiya> createState() => _BiologiyaState();
}

class _BiologiyaState extends State<Biologiya> {

  // List<Widget> page = [
  //   const Botanika(),
  //   const Zoologiya(),
  //   const Mikrobiologiya(),
  //   const Biokimyo(),
  //   const Genetika(),
 
  // ];
  


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Biologiya kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }}