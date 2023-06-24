import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Sanatshunoslik extends StatefulWidget {
  const Sanatshunoslik({super.key});

  @override
  State<Sanatshunoslik> createState() => _SanatshunoslikState();
}

class _SanatshunoslikState extends State<Sanatshunoslik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("San'atshunoslik kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}