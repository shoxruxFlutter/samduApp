import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Axborotlashtirish extends StatefulWidget {
  const Axborotlashtirish({super.key});

  @override
  State<Axborotlashtirish> createState() => _AxborotlashtirishState();
}

class _AxborotlashtirishState extends State<Axborotlashtirish> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text("Axborotlashtirish texnologiyalari kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}