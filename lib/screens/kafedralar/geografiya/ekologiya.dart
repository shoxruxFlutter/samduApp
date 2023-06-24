import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Ekologiya extends StatefulWidget {
  const Ekologiya({super.key});

  @override
  State<Ekologiya> createState() => _EkologiyaState();
}

class _EkologiyaState extends State<Ekologiya> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text("Ekologiya va hayot faoliyati xavfsizligi kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}