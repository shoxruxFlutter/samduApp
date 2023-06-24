import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Adabiyot extends StatefulWidget {
  const Adabiyot({super.key});

  @override
  State<Adabiyot> createState() => _AdabiyotState();
}

class _AdabiyotState extends State<Adabiyot> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text("Istiqlol davri adabiyoti va adabiyot nazariyasi kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}