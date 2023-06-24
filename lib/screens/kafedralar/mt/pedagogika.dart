import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Pedagogika extends StatefulWidget {
  const Pedagogika({super.key});

  @override
  State<Pedagogika> createState() => _PedagogikaState();
}

class _PedagogikaState extends State<Pedagogika> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fakultetlararo pedagogika"),
        backgroundColor: Colors.blue,
      ),
    );
   }
}