import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Arxeologiya extends StatefulWidget {
  const Arxeologiya({super.key});

  @override
  State<Arxeologiya> createState() => _ArxeologiyaState();
}

class _ArxeologiyaState extends State<Arxeologiya> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text("Arxeologiya kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}