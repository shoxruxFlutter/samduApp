import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Matematik extends StatefulWidget {
  const Matematik({super.key});

  @override
  State<Matematik> createState() => _MatematikState();
}

class _MatematikState extends State<Matematik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Matematik modellashtirish kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}