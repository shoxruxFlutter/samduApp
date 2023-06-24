import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Samarqand extends StatefulWidget {
  const Samarqand({super.key});

  @override
  State<Samarqand> createState() => _SamarqandState();
}

class _SamarqandState extends State<Samarqand> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text("Samarqand tamadduni tarixi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}