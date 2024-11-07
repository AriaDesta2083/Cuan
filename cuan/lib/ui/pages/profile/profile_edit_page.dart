import 'package:cuan/blocs/auth/auth_bloc.dart';
import 'package:cuan/models/update_user_form_model.dart';
import 'package:cuan/models/user_model.dart';
import 'package:cuan/shared/animation.dart';
import 'package:cuan/shared/helper.dart';
import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/widgets/buttons.dart';
import 'package:cuan/ui/widgets/dialog.dart';
import 'package:cuan/ui/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPage extends StatefulWidget {
  final UserModel user;
  const ProfileEditPage({super.key, required this.user});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final usernameCtrl = TextEditingController(text: '');
  final nameCtrl = TextEditingController(text: '');
  final emailCtrl = TextEditingController(text: '');
  final passCtrl = TextEditingController(text: '');

  bool validate() {
    if (usernameCtrl.text.isEmpty || nameCtrl.text.isEmpty || emailCtrl.text.isEmpty || passCtrl.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    usernameCtrl.text = widget.user.username!;
    nameCtrl.text = widget.user.name!;
    emailCtrl.text = widget.user.email!;
    passCtrl.text = widget.user.password!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        leading: IconButton(onPressed: (){
          final authState = context.read<AuthBloc>();
          if (authState.state is AuthFailed) {
            authState.add(AuthGetCurrent());
            Navigator.pop(context);
          }else{
            Navigator.pop(context);
          }
        }, icon:const Icon(Icons.arrow_back)),
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
                  CustomTextField(ctrl: usernameCtrl, title: 'Username'),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(ctrl: nameCtrl, title: 'Full Name'),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(ctrl: emailCtrl, title: 'Email Address'),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    ctrl: passCtrl,
                    title: 'Password',
                    pass: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFilledButton(
                    title: 'Update Now',
                    onTaps: () async {
                      if (validate()) {
                        bool isDone = await showDialog(
                                context: context,
                                builder: (context) => UpdateUserDialog(
                                    data: widget.user,
                                    newData: UpdateUserFormModel(
                                        email: emailCtrl.text,
                                        name: nameCtrl.text,
                                        password: passCtrl.text,
                                        username: usernameCtrl.text))) ??
                            false;
                        if (isDone) {
                          Navigator.pushNamedAndRemoveUntil(context, '/profile-success', (route) => false);
                        }else{
                          setState(() {
                            
                          });}
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

class UpdateUserDialog extends StatelessWidget {
  final UserModel data;
  final UpdateUserFormModel newData;
  const UpdateUserDialog({super.key, required this.data, required this.newData});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/ic_edit_profile.png',
          width: 24,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Tap the button if you sure to update your profile',
          style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
        ),
        const Spacer(),
        BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) async{
            if (state is AuthSuccess) {
              Navigator.pop(context, true);
            }
            if (state is AuthFailed) {
              await showCustomSnackbar(context, state.e);
              Navigator.pop(context, false);

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
                context.read<AuthBloc>().add(AuthUpdate(data, newData));
              },
            );
          },
        )
      ],
    ));
  }
}
