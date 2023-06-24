import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Tarmoqlar extends StatefulWidget {
  const Tarmoqlar({super.key});

  @override
  State<Tarmoqlar> createState() => _TarmoqlarState();
}

class _TarmoqlarState extends State<Tarmoqlar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarmoqlar iqtisodiyoti kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}