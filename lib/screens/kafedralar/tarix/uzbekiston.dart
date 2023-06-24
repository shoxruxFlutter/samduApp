import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Uzbekiston extends StatefulWidget {
  const Uzbekiston({super.key});

  @override
  State<Uzbekiston> createState() => _UzbekistonState();
}

class _UzbekistonState extends State<Uzbekiston> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("O'zbekiston tarixi kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}