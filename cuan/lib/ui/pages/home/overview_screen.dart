import 'package:flutter/material.dart';
import 'package:cuan/blocs/auth/auth_bloc.dart';
import 'package:cuan/blocs/transaction/transaction_bloc.dart';
import 'package:cuan/blocs/user/user_bloc.dart';
import 'package:cuan/models/transfer_model.dart';
import 'package:cuan/service/custom_width_height.dart';
import 'package:cuan/shared/animation.dart';
import 'package:cuan/shared/helper.dart';
import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/pages/amount/amount_transfer_page.dart';
import 'package:cuan/ui/widgets/home_items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            CustomAnimation(delay: 1, child: sectionProfile(context)),
            CustomAnimation(delay: 1.3, child: sectionCard()),
            CustomAnimation(delay: 1.5, child: sectionLevel()),
            CustomAnimation(delay: 1.8, child: sectionBuildSomething(context)),
            CustomAnimation(delay: 2, child: sectionLatestTransaction()),
            CustomAnimation(delay: 1.3, child: sectionSendAgain()),
            CustomAnimation(delay: 1.5, child: sectionTips()),
          ],
        ),
    );
  }

  Widget sectionProfile(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Howday ,',
                      style: greyTextStyle.copyWith(fontSize: 16),
                    ),
                    Text(
                      state.data.name ?? 'null',
                      style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: Hero(
                    tag: 'avatar',
                    child: Container(
                      height: 60,
                      width: 60,
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
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: whiteColor,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.check_circle,
                                    color: greenColor,
                                    size: 14,
                                  ),
                                ),
                              ),
                            )
                          : null,
                    ),
                  ),
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget sectionCard() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: const EdgeInsets.only(top: 32),
            padding: const EdgeInsets.all(30),
            width: double.infinity,
            height: 220,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                image: const DecorationImage(image: AssetImage('assets/img_bg_card.png'), fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.data.name ?? 'Null',
                  style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: 20),
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  '****  ****  ****  ${state.data.cardNumber!.substring(12, 16)}',
                  style: whiteTextStyle.copyWith(letterSpacing: 3, fontSize: 18, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Balance',
                  style: whiteTextStyle,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  formatCurrency(state.data.balance!),
                  style: whiteTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget sectionLevel() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 80,
      padding: const EdgeInsets.all(22),
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: whiteColor),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Lelvel 1',
                style: blackTextStyle.copyWith(fontWeight: medium),
              ),
              const Spacer(),
              Text(
                '70 %',
                style: greenTextStyle.copyWith(fontWeight: semiBold),
              ),
              Text(
                'of \$10M ',
                style: blackTextStyle.copyWith(fontWeight: medium),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          LinearProgressIndicator(
            borderRadius: BorderRadius.circular(10),
            color: greyColor,
            minHeight: 5,
            valueColor: AlwaysStoppedAnimation(greenColor),
            value: 0.7,
          ),
        ],
      ),
    );
  }

  Widget sectionBuildSomething(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Do Something',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServiceItem(
                title: 'Top Up',
                icUrl: 'assets/ic_topup.png',
                onTaps: () {
                  Navigator.pushNamed(context, '/topup');
                },
              ),
              HomeServiceItem(
                title: 'Send',
                icUrl: 'assets/ic_send.png',
                onTaps: () {
                  Navigator.pushNamed(context, '/transfer');
                },
              ),
              HomeServiceItem(
                title: 'Withdraw',
                icUrl: 'assets/ic_withdraw.png',
                onTaps: () {},
              ),
              HomeServiceItem(
                title: 'More',
                icUrl: 'assets/ic_more.png',
                onTaps: () {
                  showDialog(context: context, builder: (context) => const MoreDialog());
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget sectionLatestTransaction() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Transactions',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          BlocProvider(
            create: (context) => TransactionBloc()..add(const TransactionGet(6)),
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 13),
              decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(20)),
              child: BlocBuilder<TransactionBloc, TransactionState>(
                builder: (context, state) {
                  if (state is TransactionFailed) {
                    return Center(child: Text(state.e));
                  }
                  if (state is TransactionLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: orangeColor,
                      ),
                    );
                  }
                  if (state is TransactionSuccess) {
                    return Column(
                      children: state.listData.map((data) {
                        return HomeLatestTransactionItem(data: data);
                      }).toList(),
                    );
                  }
                  return Container();
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget sectionSendAgain() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Again',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          BlocProvider(
            create: (context) => UserBloc()..add(UserGetRecentUser()),
            child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserSuccess) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: state.listData
                            .map((data) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AmountTransferPage(
                                        data: TransferModel(
                                          sendTo: data.username,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: HomeUsersItem(username: data.username!, imgUrl: data.profilePicture!)))
                            .toList(),
                      ),
                    );
                  }
                  if (state is UserLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: orangeColor,
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget sectionTips() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friendly Tips',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          const Wrap(
            spacing: 10,
            runSpacing: 15,
            children: [
              HomeTipsItem(
                icUrl: 'assets/img_tips1.png',
                title: 'Best tips for using a credit card',
              ),
              HomeTipsItem(
                icUrl: 'assets/img_tips2.png',
                title: 'Spot the good pie of finance model better advices',
              ),
              HomeTipsItem(
                icUrl: 'assets/img_tips3.png',
                title: 'Great hack to get better advices better advices',
              ),
              HomeTipsItem(
                icUrl: 'assets/img_tips4.png',
                title: 'Save more penny buy this instead',
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MoreDialog extends StatelessWidget {
  const MoreDialog({super.key});

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
          height: getH(context, 326),
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(color: lightBackgroundColor, borderRadius: BorderRadius.circular(40)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Do More With Us',
                style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
              SizedBox(
                height: getH(context, 5),
              ),
              Wrap(
                spacing: 20,
                runSpacing: 10,
                children: [
                  HomeServiceItem(
                    icUrl: 'assets/ic_product_data.png',
                    title: 'Data',
                    onTaps: () {
                      Navigator.pushNamed(context, '/data-provider');
                    },
                  ),
                  HomeServiceItem(
                    icUrl: 'assets/ic_product_water.png',
                    title: 'Water',
                    onTaps: () {},
                  ),
                  HomeServiceItem(
                    icUrl: 'assets/ic_product_stream.png',
                    title: 'Stream',
                    onTaps: () {},
                  ),
                  HomeServiceItem(
                    icUrl: 'assets/ic_product_movie.png',
                    title: 'Movie',
                    onTaps: () {},
                  ),
                  HomeServiceItem(
                    icUrl: 'assets/ic_product_food.png',
                    title: 'Food',
                    onTaps: () {},
                  ),
                  HomeServiceItem(
                    icUrl: 'assets/ic_product_travel.png',
                    title: 'Travel',
                    onTaps: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}