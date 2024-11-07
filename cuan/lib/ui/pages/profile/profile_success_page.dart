import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class ProfileSuccessPage extends StatelessWidget {
  const ProfileSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nice Update !',
                style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 26,
              ),
              Text(
                'Your data is safe with\nour system',
                style: greyTextStyle.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomFilledButton(
                title: 'My Profile',
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
