import 'package:cuan/blocs/auth/auth_bloc.dart';
import 'package:cuan/blocs/tab/tab_bloc.dart';
import 'package:cuan/blocs/user/user_bloc.dart';
import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/pages/home/home_page.dart';
import 'package:cuan/ui/pages/more/data_package_page.dart';
import 'package:cuan/ui/pages/more/data_provider_page.dart';
import 'package:cuan/ui/pages/more/data_success_page.dart';
import 'package:cuan/ui/pages/pin/pin_page.dart';
import 'package:cuan/ui/pages/profile/profile_page.dart';
import 'package:cuan/ui/pages/profile/profile_success_page.dart';
import 'package:cuan/ui/pages/splash/onboarding_page.dart';
import 'package:cuan/ui/pages/sign/signin_page.dart';
import 'package:cuan/ui/pages/sign/signup_page.dart';
import 'package:cuan/ui/pages/sign/signup_success_page.dart';
import 'package:cuan/ui/pages/splash/splash_page.dart';
import 'package:cuan/ui/pages/topup/topup_page.dart';
import 'package:cuan/ui/pages/transfer/transfer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()..add(AuthGetCurrent())),
        BlocProvider(create: (context) => TabBloc()),
        BlocProvider(create: (context) => UserBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                centerTitle: true, titleTextStyle: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold)),
            scaffoldBackgroundColor: lightBackgroundColor),
        routes: {
          '/': (context) => const SplashPage(),
          '/onboarding': (context) => const OnboardingPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/sign-up-success': (context) => const SignUpSuccessPage(),
          '/home': (context) => const HomePage(),
          '/pin': (context) => const PinPage(),
          '/profile': (context) => const ProfilePage(),
          '/profile-success': (context) => const ProfileSuccessPage(),
          '/topup': (context) => const TopupPage(),
          '/transfer': (context) => const TransferPage(),
          '/data-provider': (context) => const DataProviderPage(),
          '/data-package': (context) => const DataPackagePage(),
          '/data-package-success': (context) => const DataPackageSuccessPage(),
        },
      ),
    );
  }
}
