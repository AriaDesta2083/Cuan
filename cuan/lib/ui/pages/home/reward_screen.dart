import 'package:flutter/material.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      children: const [
        Center(
          child: Text('RewardScreen'),
        )
      ],
    ));
  }
}
