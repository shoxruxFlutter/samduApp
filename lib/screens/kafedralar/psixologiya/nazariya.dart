import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Nazariya extends StatefulWidget {
  const Nazariya({super.key});

  @override
  State<Nazariya> createState() => _NazariyaState();
}

class _NazariyaState extends State<Nazariya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Psixologiya nazariyasi va amaliyoti kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}