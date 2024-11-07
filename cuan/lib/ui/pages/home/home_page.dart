import 'package:cuan/blocs/tab/tab_bloc.dart';
import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/pages/home/history_screen.dart';
import 'package:cuan/ui/pages/home/overview_screen.dart';
import 'package:cuan/ui/pages/home/reward_screen.dart';
import 'package:cuan/ui/pages/home/statistic_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: lightBackgroundColor,
          body: bodyItems[state.index],
          floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {},
            backgroundColor: orangeColor,
            child: Image.asset(
              'assets/ic_plus_circle.png',
              width: 24,
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: whiteColor,
            shape: const CircularNotchedRectangle(),
            clipBehavior: Clip.antiAlias,
            notchMargin: 6,
            elevation: 0,
            padding: const EdgeInsets.all(0),
            child: BottomNavigationBar(
              items: listButtomNavigationBar,
              currentIndex: state.index,
              onTap: (val) {
                context.read<TabBloc>().add(TabChange(val));
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: whiteColor,
              elevation: 0,
              selectedIconTheme: IconThemeData(color: orangeColor, shadows: lightShadow),
              unselectedIconTheme: IconThemeData(
                color: blackColor,
              ),
              selectedItemColor: orangeColor,
              unselectedItemColor: blackColor,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              selectedLabelStyle: blueTextStyle.copyWith(fontSize: 12, fontWeight: semiBold),
            ),
          ),
        );
      },
    );
  }
}

List<Widget> bodyItems = [
  const OverviewScreen(),
  const HistoryScreen(),
  const StatisticScreen(),
  const RewardScreen(),
];

List<BottomNavigationBarItem> listButtomNavigationBar = [
  const BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(
          'assets/ic_overview.png',
        ),
      ),
      label: 'Overview'),
  const BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(
          'assets/ic_history.png',
        ),
      ),
      label: 'History'),
  const BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(
          'assets/ic_statistic.png',
        ),
      ),
      label: 'Statistic'),
  const BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(
          'assets/ic_reward.png',
        ),
      ),
      label: 'Reward'),
];
