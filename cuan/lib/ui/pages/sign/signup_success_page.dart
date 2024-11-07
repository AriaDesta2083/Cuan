import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class SignUpSuccessPage extends StatelessWidget {
  const SignUpSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register Account\nSuccess',
                style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 26,
              ),
              Text(
                'Grow your finance start\n together with us',
                style: greyTextStyle.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomFilledButton(
                title: 'Get Started',
                width: 230,
                onTaps: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
