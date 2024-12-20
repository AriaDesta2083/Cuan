import 'dart:async';

import 'package:cuan/blocs/auth/auth_bloc.dart';
import 'package:cuan/ui/animations/animation.dart';
import 'package:cuan/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(context, '/home', (route)=> false);
          }
          if (state is AuthFailed) {
            Timer(const Duration(seconds: 2), () {
                Navigator.pushNamedAndRemoveUntil(context, '/onboarding', (route)=> false);
             });
          }
        },
        child: Center(
            child: CustomAnimation(
          delay: 1,
          child: Container(
            width: 155,
            height: 55,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img_logo_dark.png'),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
