import 'package:flutter/material.dart';

const width4 = Width(8);
const width8 = Width(8);
const width16 = Width(8);

const height4 = Height(4);
const height8 = Height(8);
const height16 = Height(16);

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
