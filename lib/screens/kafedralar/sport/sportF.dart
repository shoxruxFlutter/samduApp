import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SportF extends StatefulWidget {
  const SportF({super.key});

  @override
  State<SportF> createState() => _SportFState();
}

class _SportFState extends State<SportF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sport faoliyati"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}