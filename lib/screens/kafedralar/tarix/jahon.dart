import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Jahon extends StatefulWidget {
  const Jahon({super.key});

  @override
  State<Jahon> createState() => _JahonState();
}

class _JahonState extends State<Jahon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jahon tarixi kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}