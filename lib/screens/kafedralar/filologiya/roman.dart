import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Roman extends StatefulWidget {
  const Roman({super.key});

  @override
  State<Roman> createState() => _RomanState();
}

class _RomanState extends State<Roman> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Roman-german tillari"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}