import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Tilshunoslik extends StatefulWidget {
  const Tilshunoslik({super.key});

  @override
  State<Tilshunoslik> createState() => _TilshunoslikState();
}

class _TilshunoslikState extends State<Tilshunoslik> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text("O‘zbek tilshunosligi kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}