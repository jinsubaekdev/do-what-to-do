import 'package:flutter/material.dart';

const width8 = Width(8);

class Width extends StatelessWidget {
  final double value;
  const Width(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: value);
  }
}

class Height extends StatelessWidget {
  final double value;
  const Height(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: value);
  }
}
