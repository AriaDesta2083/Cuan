import 'package:cuan/blocs/auth/auth_bloc.dart';
import 'package:cuan/ui/animations/animation.dart';
import 'package:cuan/shared/helper.dart';
import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/pages/profile/profile_edit_page.dart';
import 'package:cuan/ui/pages/profile/profile_edit_pin_page.dart';
import 'package:cuan/ui/widgets/buttons.dart';
import 'package:cuan/ui/widgets/profile_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 38),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: whiteColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 22,
                      ),
                      Hero(
                        tag: 'avatar',
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: state.data.profilePicture == null
                                  ? const AssetImage('assets/img_profile.png')
                                  : NetworkImage(state.data.profilePicture!) as ImageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: state.data.verified == 1
                              ? Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 14),
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: whiteColor,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.check_circle,
                                        color: greenColor,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                )
                              : null,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        state.data.name ?? 'null',
                        style: blackTextStyle.copyWith(fontSize: 18, fontWeight: medium),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomAnimation(
                        delay: 1,
                        child: ProfileMenuItem(
                          title: 'Edit Profile',
                          icUrl: 'assets/ic_edit_profile.png',
                          onTaps: () async {
                            if (await Navigator.pushNamed(context, '/pin') == true) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ProfileEditPage(user: state.data)));
                            }
                          },
                        ),
                      ),
                      CustomAnimation(
                        delay: 1.2,
                        child: ProfileMenuItem(
                          title: 'My Pin',
                          icUrl: 'assets/ic_pin.png',
                          onTaps: () async {
                            if (await Navigator.pushNamed(context, '/pin') == true) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ProfileEditPinPage(user: state.data)));
                            }
                          },
                        ),
                      ),
                      CustomAnimation(
                        delay: 1.3,
                        child: ProfileMenuItem(
                          title: 'Wallet Settings',
                          icUrl: 'assets/ic_wallet.png',
                          onTaps: () {},
                        ),
                      ),
                      const CustomAnimation(
                        delay: 1.4,
                        child: ProfileMenuItem(
                          title: 'My Rewards',
                          icUrl: 'assets/ic_my_rewards.png',
                          notif: 2,
                        ),
                      ),
                      const CustomAnimation(
                        delay: 1.5,
                        child: ProfileMenuItem(
                          title: 'Help Center',
                          icUrl: 'assets/ic_help.png',
                        ),
                      ),
                      CustomAnimation(
                        delay: 1.6,
                        child: ProfileMenuItem(
                          title: 'Logout',
                          icUrl: 'assets/ic_logout.png',
                          onTaps: () {
                            showDialog(context: context, builder: (context) => const LogoutDialog());
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Report a Problem',
                  style: greyTextStyle.copyWith(fontSize: 16),
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment: Alignment.bottomCenter,
        content: CustomAnimation(
            delay: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 25),
              decoration: BoxDecoration(color: lightBackgroundColor, borderRadius: BorderRadius.circular(25)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/ic_logout.png',
                    width: 24,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Thanks you. Hope to see you back soon.",
                    style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                  ),
                  const Spacer(),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthInitial) {
                        Navigator.pushNamedAndRemoveUntil(context, '/sign-in', (context) => false);
                      }
                      if (state is AuthFailed) {
                        showCustomSnackbar(context, state.e);
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
                        title: 'Logout',
                        onTaps: () {
                          context.read<AuthBloc>().add(AuthLogout());
                        },
                      );
                    },
                  )
                ],
              ),
            )));
  }
}
