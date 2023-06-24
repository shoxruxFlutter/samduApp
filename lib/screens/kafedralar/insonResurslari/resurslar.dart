import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Resurslar extends StatefulWidget {
  const Resurslar({super.key});

  @override
  State<Resurslar> createState() => _ResurslarState();
}

class _ResurslarState extends State<Resurslar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inson resurslarini boshqarish kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}