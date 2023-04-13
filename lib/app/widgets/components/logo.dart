import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double height;
  const Logo({Key? key, this.height = 100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Logo Here", style: TextStyle(fontSize: 50));
  }
}
