import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Falsafa extends StatefulWidget {
  const Falsafa({super.key});

  @override
  State<Falsafa> createState() => _FalsafaState();
}

class _FalsafaState extends State<Falsafa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Falsafa va milliy g'oya kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}