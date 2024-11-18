import 'dart:convert';
import 'dart:io';

import 'package:cuan/blocs/auth/auth_bloc.dart';
import 'package:cuan/models/signup_form_model.dart';
import 'package:cuan/ui/animations/animation.dart';
import 'package:cuan/shared/helper.dart';
import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/widgets/buttons.dart';
import 'package:cuan/ui/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpVerifyPage extends StatefulWidget {
  final SignUpFormModel data;
  const SignUpVerifyPage({super.key, required this.data});

  @override
  State<SignUpVerifyPage> createState() => _SignUpVerifyPageState();
}

class _SignUpVerifyPageState extends State<SignUpVerifyPage> {
  XFile? selectedImages;

  selectImage() async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        selectedImages = image;
        print(selectedImages!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(context, '/sign-up-success', (route) => false);
          }
        },
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const CustomAnimation(delay: 1, child: CustomLogo()),
              CustomAnimation(
                delay: 1.3,
                child: Text(
                  'Verify Your\nAccount',
                  style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 30,
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
                      GestureDetector(
                        onTap: () {
                          selectImage();
                        },
                        child: Container(
                          width: selectedImages == null ? 120 : 200,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: selectedImages == null ? BoxShape.circle : BoxShape.rectangle,
                            borderRadius: selectedImages == null ? null : BorderRadius.circular(5),
                            color: lightBackgroundColor,
                            image: selectedImages == null
                                ? null
                                : DecorationImage(
                                    filterQuality: FilterQuality.high,
                                    image: FileImage(File(selectedImages!.path)),
                                    fit: BoxFit.cover),
                          ),
                          child: selectedImages != null
                              ? null
                              : Center(
                                  child: Image.asset(
                                  'assets/ic_upload.png',
                                  width: 32,
                                  height: 32,
                                )),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Upload KTP',
                        textAlign: TextAlign.center,
                        style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomFilledButton(
                        title: 'Continue',
                        onTaps: () {
                          if (selectedImages != null) {
                            context.read<AuthBloc>().add(AuthRegister(widget.data.copyWith(
                                  ktp:
                                      'data:image/png;base64,${base64Encode(File(selectedImages!.path).readAsBytesSync())}',
                                )));
                          } else {
                            showCustomSnackbar(context, 'Ktp still empty. Please add first');
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextButton(
                title: 'Skip for Now',
                onTaps: () {
                  context.read<AuthBloc>().add(AuthRegister(widget.data));
                },
              )
            ],
          );
        },
      ),
    );
  }
}
