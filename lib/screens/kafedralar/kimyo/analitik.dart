import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Analitik extends StatefulWidget {
  const Analitik({super.key});

  @override
  State<Analitik> createState() => _AnalitikState();
}

class _AnalitikState extends State<Analitik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analitik kimyo kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}