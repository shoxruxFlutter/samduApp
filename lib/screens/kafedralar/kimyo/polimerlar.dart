import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Polimerlar extends StatefulWidget {
  const Polimerlar({super.key});

  @override
  State<Polimerlar> createState() => _PolimerlarState();
}

class _PolimerlarState extends State<Polimerlar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Polimerlar kimyosi va kimyoviy texnologiya"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}