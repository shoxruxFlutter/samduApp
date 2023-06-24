import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Fizikaviy extends StatefulWidget {
  const Fizikaviy({super.key});

  @override
  State<Fizikaviy> createState() => _FizikaviyState();
}

class _FizikaviyState extends State<Fizikaviy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fizikaviy va kolloid kimyo kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}