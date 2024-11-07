import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 155,
      margin: const EdgeInsets.only(top: 70, bottom: 70),
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/img_logo_light.png'))),
    );
  }
}
