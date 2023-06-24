import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Tojik extends StatefulWidget {
  const Tojik({super.key});

  @override
  State<Tojik> createState() => _TojikState();
}

class _TojikState extends State<Tojik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tojik filologiyasi va xorijiy sharq tillari"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}