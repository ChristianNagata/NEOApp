import 'package:flutter/material.dart';
import 'package:neo/screens/home.dart';

void main() {
  runApp(const Neo());
}

class Neo extends StatelessWidget {
  const Neo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

