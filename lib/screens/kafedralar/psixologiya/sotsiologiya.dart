import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Sotsiologiya extends StatefulWidget {
  const Sotsiologiya({super.key});

  @override
  State<Sotsiologiya> createState() => _SotsiologiyaState();
}

class _SotsiologiyaState extends State<Sotsiologiya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sotsiologiya va ijtimoiy ish kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}