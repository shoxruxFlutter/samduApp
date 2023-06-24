import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Boshlangich extends StatefulWidget {
  const Boshlangich({super.key});

  @override
  State<Boshlangich> createState() => _BoshlangichState();
}

class _BoshlangichState extends State<Boshlangich> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Boshlang'ich va texnologik ta'lim"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}