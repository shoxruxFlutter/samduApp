import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Madaniyat extends StatefulWidget {
  const Madaniyat({super.key});

  @override
  State<Madaniyat> createState() => _MadaniyatState();
}

class _MadaniyatState extends State<Madaniyat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fakultetlararo jismoniy madaniyat"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}