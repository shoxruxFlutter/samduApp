import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Huquqshunoslik extends StatefulWidget {
  const Huquqshunoslik({super.key});

  @override
  State<Huquqshunoslik> createState() => _HuquqshunoslikState();
}

class _HuquqshunoslikState extends State<Huquqshunoslik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Huquqshunoslik va huquq ta’limi kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}