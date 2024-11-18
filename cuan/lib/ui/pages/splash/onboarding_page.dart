import 'package:cuan/service/custom_width_height.dart';
import 'package:cuan/ui/animations/animation.dart';
import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';

// ! MMBUTUHKAN CAROUSEL SLIDER UNTUK MENAMPILKAN GAMBAR SLIDER

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  CarouselController carouselCtrl = CarouselController();
  List<String> title = ['Grow Your\nFinancial Today', 'Build from\nZero to Freedim', 'Start Together'];
  List<String> subtitle = [
    'Our system in bussinesyou to\narchive a better goal',
    'We provide tips for you so that\nyou can adapt casior',
    'We will guide you to\nwhere you wonted it too'
  ];
  @override
  Widget build(BuildContext context) {
    setState(() {
      
    });
    return Scaffold(
        backgroundColor: lightBackgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              CarouselSlider(
                items: [
                  CustomAnimation(
                    delay: 1.5,
                    child: Image.asset(
                      'assets/img_onboarding1.png',
                      height: getH(context, 331),
                    ),
                  ),
                  CustomAnimation(
                    delay: 1.5,
                    child: Image.asset(
                      'assets/img_onboarding2.png',
                      height: getH(context, 331),
                    ),
                  ),
                  CustomAnimation(
                    delay: 1.5,
                    child: Image.asset(
                      'assets/img_onboarding3.png',
                      height: getH(context, 331),
                    ),
                  ),
                ],
                // carouselctrl
                options: CarouselOptions(
                  height: getH(context, 331),
                  // fix content
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                ),
                carouselController: carouselCtrl,
              ),
              SizedBox(
                height: getH(context, 80),
              ),
              Container(
                height: getH(context, 300),
                width: getW(context, 327),
                margin: EdgeInsets.all(getH(context, 24)),
                padding: EdgeInsets.symmetric(
                  horizontal: getW(context, 22),
                  vertical: getH(context, 24),
                ),
                decoration: BoxDecoration(
                  boxShadow: lightShadow,
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CustomAnimation(
                  delay: 1.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title[currentIndex],
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: getH(context, 26),
                      ),
                      Text(
                        subtitle[currentIndex],
                        style: greyTextStyle.copyWith(fontWeight: regular, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: (currentIndex != 2) ? getH(context, 50) : getH(context, 38),
                      ),
                      (currentIndex != 2)
                          ? Row(
                              children: [
                                Container(
                                  width: getH(context, 12),
                                  height: getW(context, 12),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (currentIndex == 0) ? yellowColor : lightBackgroundColor),
                                ),
                                Container(
                                  width: getH(context, 12),
                                  height: getW(context, 12),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (currentIndex == 1) ? yellowColor : lightBackgroundColor),
                                ),
                                Container(
                                  width: getH(context, 12),
                                  height: getW(context, 12),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (currentIndex == 2) ? yellowColor : lightBackgroundColor),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: getW(context, 150),
                                  height: getH(context, 50),
                                  child: TextButton(
                                    onPressed: () {
                                      carouselCtrl.nextPage();
                                    },
                                    style: TextButton.styleFrom(
                                        backgroundColor: orangeColor,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(56))),
                                    child: Text(
                                      'Continue',
                                      style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                CustomFilledButton(
                                  title: 'Get Started',
                                  onTaps: () {
                                    Navigator.pushNamedAndRemoveUntil(context, '/sign-up', (route) => false);
                                  },
                                ),
                                CustomTextButton(
                                  title: 'Sign In',
                                  onTaps: () {
                                    Navigator.pushNamedAndRemoveUntil(context, '/sign-in', (route) => false);
                                  },
                                ),
                              ],
                            )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
