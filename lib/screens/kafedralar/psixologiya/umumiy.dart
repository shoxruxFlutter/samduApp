import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Umumiy extends StatefulWidget {
  const Umumiy({super.key});

  @override
  State<Umumiy> createState() => _UmumiyState();
}

class _UmumiyState extends State<Umumiy> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text("Umumiy psixologiya kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}