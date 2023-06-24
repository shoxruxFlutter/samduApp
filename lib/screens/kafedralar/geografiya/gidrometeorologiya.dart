import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Gidrometeorologiya extends StatefulWidget {
  const Gidrometeorologiya({super.key});

  @override
  State<Gidrometeorologiya> createState() => _GidrometeorologiyaState();
}

class _GidrometeorologiyaState extends State<Gidrometeorologiya> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text("Gidrometeorologiya kafedrasi"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}