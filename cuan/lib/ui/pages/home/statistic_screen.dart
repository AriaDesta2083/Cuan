import 'package:flutter/material.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      children: const [
        Center(
          child: Text('StatisticScreen'),
        )
      ],
    ));
  }
}