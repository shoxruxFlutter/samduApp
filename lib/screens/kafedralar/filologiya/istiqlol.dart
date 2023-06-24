import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Istiqlol extends StatefulWidget {
  const Istiqlol({super.key});

  @override
  State<Istiqlol> createState() => _IstiqlolState();
}

class _IstiqlolState extends State<Istiqlol> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Istiqlol davri adabiyoti va adabiyot nazariyasi kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}