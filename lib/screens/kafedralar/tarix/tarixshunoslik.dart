import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Tarixshunoslik extends StatefulWidget {
  const Tarixshunoslik({super.key});

  @override
  State<Tarixshunoslik> createState() => _TarixshunoslikState();
}

class _TarixshunoslikState extends State<Tarixshunoslik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarixshunoslik va manbashunoslik kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}