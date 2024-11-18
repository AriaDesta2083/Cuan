import 'package:cuan/blocs/auth/auth_bloc.dart';
import 'package:cuan/models/signin_form_model.dart';
import 'package:cuan/ui/animations/animation.dart';
import 'package:cuan/shared/helper.dart';
import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/widgets/buttons.dart';
import 'package:cuan/ui/widgets/logo.dart';
import 'package:cuan/ui/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailCtrl = TextEditingController(text: '');
  TextEditingController passCtrl = TextEditingController(text: '');

  bool validate() {
    if (emailCtrl.text.isEmpty || passCtrl.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: SafeArea(
        child: ListView(
          // Kalo listview butuh widget buat masukin gambar tidak bisa Image.asset
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const CustomAnimation(delay: 1, child: CustomLogo()),
            CustomAnimation(
              delay: 1.2,
              child: Text(
                'Sign In &\nGrow Your Finance',
                style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomAnimation(
              delay: 1.4,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: whiteColor,
                  boxShadow: lightShadow,
                ),
                child: Column(
                  children: [
                    CustomTextField(title: 'Email Addres',ctrl: emailCtrl,),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      title: 'Password',
                      pass: true,
                      ctrl: passCtrl,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password',
                              style: orangeTextStyle,
                            ))),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSuccess) {
                          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                        }
                        if (state is AuthFailed) {
                          showCustomSnackbar(context, state.e);
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return CircularProgressIndicator(
                            color: orangeColor,
                          );
                        } else {
                          return CustomFilledButton(
                            title: 'Sign In',
                            onTaps: () {
                              if (validate()) {
                                context
                                    .read<AuthBloc>()
                                    .add(AuthLogin(SignInFormModel(email: emailCtrl.text, password: passCtrl.text)));
                              } else {
                                showCustomSnackbar(context, 'Data is required. Please complete it first !');
                              }
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextButton(
                title: 'Create New Account',
                onTaps: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/sign-up', (route) => false);
                })
          ],
        ),
      ),
    );
  }
}
