import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Ingliz extends StatefulWidget {
  const Ingliz({super.key});

  @override
  State<Ingliz> createState() => _InglizState();
}

class _InglizState extends State<Ingliz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ingliz tili kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
   }
}