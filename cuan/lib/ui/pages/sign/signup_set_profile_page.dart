import 'dart:convert';
import 'dart:io';

import 'package:cuan/models/signup_form_model.dart';
import 'package:cuan/ui/animations/animation.dart';
import 'package:cuan/shared/helper.dart';
import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/pages/sign/signup_verify_page.dart';
import 'package:cuan/ui/widgets/buttons.dart';
import 'package:cuan/ui/widgets/logo.dart';
import 'package:cuan/ui/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpSetProfilePage extends StatefulWidget {
  final SignUpFormModel data;
  const SignUpSetProfilePage({super.key, required this.data});

  @override
  State<SignUpSetProfilePage> createState() => _SignUpSetProfilePageState();
}

class _SignUpSetProfilePageState extends State<SignUpSetProfilePage> {
  final pinCtrl = TextEditingController(text: '');
  XFile? selectedImages;

  selectImage() async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImages = image;
        print(selectedImages!.path);
      });
    }
  }

  bool validate() {
    if (pinCtrl.text.length != 6) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.data.toJson());

    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: ListView(
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
            height: 30,
          ),
          CustomAnimation(
            delay: 1.5,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20), color: whiteColor, boxShadow: lightShadow),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      selectImage();
                    },
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
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
                    height: 16,
                  ),
                  Text(
                    'Upload Image',
                    textAlign: TextAlign.center,
                    style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    title: 'Set PIN ( 6 digit number )',
                    ctrl: pinCtrl,
                    pass: true,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFilledButton(
                    title: 'Continue',
                    onTaps: () {
                      if (validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpVerifyPage(
                                      data: widget.data.copyWith(pin: pinCtrl.text, profilePicture: selectedImages == null
                                  ? null
                                  : 'data:image/png;base64,${base64Encode(File(selectedImages!.path)
                                          .readAsBytesSync())}',),
                                    )));
                      } else {
                        showCustomSnackbar(context, 'Failed. Please complete pin 6 digit');
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
