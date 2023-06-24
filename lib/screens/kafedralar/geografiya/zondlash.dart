import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Zondlash extends StatefulWidget {
  const Zondlash({super.key});

  @override
  State<Zondlash> createState() => _ZondlashState();
}

class _ZondlashState extends State<Zondlash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Masofaviy zondlash va GIS dasturlari markazi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}