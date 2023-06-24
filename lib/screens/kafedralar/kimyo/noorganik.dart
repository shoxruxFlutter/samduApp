import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Noorganik extends StatefulWidget {
  const Noorganik({super.key});

  @override
  State<Noorganik> createState() => _NoorganikState();
}

class _NoorganikState extends State<Noorganik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Noorganik kimyo va materialshunoslik kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}