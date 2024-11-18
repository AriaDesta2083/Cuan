import 'package:cuan/blocs/auth/auth_bloc.dart';
import 'package:cuan/models/user_model.dart';
import 'package:cuan/ui/animations/animation.dart';
import 'package:cuan/shared/helper.dart';
import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/widgets/buttons.dart';
import 'package:cuan/ui/widgets/dialog.dart';
import 'package:cuan/ui/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPinPage extends StatefulWidget {
  final UserModel user;
  const ProfileEditPinPage({super.key, required this.user});

  @override
  State<ProfileEditPinPage> createState() => _ProfileEditPinPageState();
}

class _ProfileEditPinPageState extends State<ProfileEditPinPage> {
  final oldCtrl = TextEditingController(text: '');
  final newCtrl = TextEditingController(text: '');

  bool validate() {
    if (oldCtrl.text.isEmpty || newCtrl.text.isEmpty) {
      return false;
    }
    if (oldCtrl.text.length != 6 || newCtrl.text.length != 6) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit PIN'),
      ),
      body: ListView(
        children: [
          CustomAnimation(
            delay: 1,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 38),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: whiteColor),
              child: Column(
                children: [
                  CustomTextField(
                    ctrl: oldCtrl,
                    title: 'Old PIN',
                    pass: true,
                    isPin: true,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(6),
                    ],
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    ctrl: newCtrl,
                    title: 'New PIN',
                    pass: true,
                    isPin: true,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(6),
                    ],
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFilledButton(
                    title: 'Update Now',
                    onTaps: () {
                      if (validate()) {
                        if (oldCtrl.text == widget.user.pin) {
                          showDialog(
                              context: context,
                              builder: (context) => PinDialog(
                                    user: widget.user,
                                    newPin: newCtrl.text,
                                  ));
                        } else {
                          showCustomSnackbar(context, "Old PIN Uncorrect");
                        }
                      } else {
                        showCustomSnackbar(context, 'Failed. Please complete PIN 6 digit');
                      }
                      // Navigator.pushNamedAndRemoveUntil(context, '/profile-success', (route) => false);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PinDialog extends StatelessWidget {
  final UserModel user;
  final String newPin;
  const PinDialog({super.key, required this.user, required this.newPin});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/ic_pin.png',
          width: 24,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Tap the button if you sure to update your pin",
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
        ),
        const Spacer(),
        BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(context, '/profile-success', (route) => false);
            }
            if (state is AuthFailed) {
              showCustomSnackbar(context, state.e);
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: orangeColor,
                ),
              );
            }
            return CustomFilledButton(
              title: 'Update',
              onTaps: () {
                context.read<AuthBloc>().add(AuthPin(user, newPin));
              },
            );
          },
        )
      ],
    ));
  }
}
