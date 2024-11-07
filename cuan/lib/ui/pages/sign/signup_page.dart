import 'package:cuan/blocs/auth/auth_bloc.dart';
import 'package:cuan/models/signup_form_model.dart';
import 'package:cuan/shared/animation.dart';
import 'package:cuan/shared/helper.dart';
import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/pages/sign/signin_page.dart';
import 'package:cuan/ui/pages/sign/signup_set_profile_page.dart';
import 'package:cuan/ui/widgets/buttons.dart';
import 'package:cuan/ui/widgets/logo.dart';
import 'package:cuan/ui/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameCtrl = TextEditingController(text: '');
  final emailCtrl = TextEditingController(text: '');
  final passCtrl = TextEditingController(text: '');

  bool validate() {
    if (nameCtrl.text.isEmpty || emailCtrl.text.isEmpty || passCtrl.text.isEmpty) {
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
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const CustomAnimation(delay: 1, child: CustomLogo()),
              CustomAnimation(
                delay: 1.3,
                child: Text(
                  'Join Us to Unlock\nYour Growth',
                  style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomAnimation(
                delay: 1.5,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: whiteColor,
                    boxShadow: lightShadow,
                  ),
                  child: Column(
                    children: [
                      CustomTextField(
                        title: 'Full Name',
                        ctrl: nameCtrl,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        title: 'Email Addres',
                        ctrl: emailCtrl,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        title: 'Password',
                        pass: true,
                        ctrl: passCtrl,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is AuthCheckEmailSuccess) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpSetProfilePage(
                                  data: SignUpFormModel(
                                    name: nameCtrl.text,
                                    email: emailCtrl.text,
                                    password: passCtrl.text,
                                  ),
                                ),
                              ),
                            );
                          }
                          if (state is AuthFailed) {
                            showCustomSnackbar(context, state.e);
                          }
                        },
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return Center(
                              child: CircularProgressIndicator(color: orangeColor,),
                            );
                          }
                          return CustomFilledButton(
                            title: 'Continue',
                            onTaps: () {
                              if (validate()) {
                                context.read<AuthBloc>().add(AuthCheckEmail(emailCtrl.text));
                              } else {
                                showCustomSnackbar(context, 'Data is required. Please complete it first!');
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextButton(
                title: 'Sign In',
                onTaps: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInPage()));
                },
              )
            ],
          ),
        ));
  }
}
