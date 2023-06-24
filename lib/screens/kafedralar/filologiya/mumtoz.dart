import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Mumtoz extends StatefulWidget {
  const Mumtoz({super.key});

  @override
  State<Mumtoz> createState() => _MumtozState();
}

class _MumtozState extends State<Mumtoz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mumtoz adabiyot tarixi kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
   }
}