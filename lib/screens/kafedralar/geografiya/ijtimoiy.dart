import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Ijtimoiy extends StatefulWidget {
  const Ijtimoiy({super.key});

  @override
  State<Ijtimoiy> createState() => _IjtimoiyState();
}

class _IjtimoiyState extends State<Ijtimoiy> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text("Ijtimoiy - iqtisodiy geografiya kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}