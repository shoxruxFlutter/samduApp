import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Raqamli extends StatefulWidget {
  const Raqamli({super.key});

  @override
  State<Raqamli> createState() => _RaqamliState();
}

class _RaqamliState extends State<Raqamli> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text("Raqamli iqtisodiyot kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}