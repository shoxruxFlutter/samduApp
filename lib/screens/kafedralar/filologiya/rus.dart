import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Rus extends StatefulWidget {
  const Rus({super.key});

  @override
  State<Rus> createState() => _RusState();
}

class _RusState extends State<Rus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rus filologiyasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}