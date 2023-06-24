import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Maktabgacha extends StatefulWidget {
  const Maktabgacha({super.key});

  @override
  State<Maktabgacha> createState() => _MaktabgachaState();
}

class _MaktabgachaState extends State<Maktabgacha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Maktabgacha ta'lim"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}