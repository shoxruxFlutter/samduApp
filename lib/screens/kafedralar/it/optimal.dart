import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Optimal extends StatefulWidget {
  const Optimal({super.key});

  @override
  State<Optimal> createState() => _OptimalState();
}

class _OptimalState extends State<Optimal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Optimal boshqaruv metodlari kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}