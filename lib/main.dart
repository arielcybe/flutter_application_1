import 'package:flutter/material.dart';

void main() {
  runApp(const Taller());
}

class Taller extends StatelessWidget {
  const Taller({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Inicio(),
    );
  }
}

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
    );
  }
}
