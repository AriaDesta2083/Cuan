import 'package:cuan/blocs/auth/auth_bloc.dart';
import 'package:cuan/ui/animations/animation.dart';
import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferSuccessPage extends StatelessWidget {
  const TransferSuccessPage({super.key,});

  @override
Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: CustomAnimation(
          delay: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Transfer Berhasil',
                style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 26,
              ),
              Text(
                'Use the money wisely and\ngrow your finance',
                style: greyTextStyle.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return CircularProgressIndicator(
                      color: orangeColor,
                    );
                  }
                  return CustomFilledButton(
                    title: 'Back to Home',
                    width: 230,
                    onTaps: () {
                      context.read<AuthBloc>().add(AuthGetCurrent());
                    },
                  );
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
