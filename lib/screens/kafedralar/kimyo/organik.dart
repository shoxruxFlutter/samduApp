import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Organik extends StatefulWidget {
  const Organik({super.key});

  @override
  State<Organik> createState() => _OrganikState();
}

class _OrganikState extends State<Organik> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text("Organik sintez va bioorganik kimyo kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}