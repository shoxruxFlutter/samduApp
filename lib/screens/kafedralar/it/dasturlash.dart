import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Dasturlash extends StatefulWidget {
  const Dasturlash({super.key});

  @override
  State<Dasturlash> createState() => _DasturlashState();
}

class _DasturlashState extends State<Dasturlash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dasturiy injiniring kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}