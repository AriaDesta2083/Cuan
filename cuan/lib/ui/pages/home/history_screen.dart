import 'package:cuan/blocs/transaction/transaction_bloc.dart';
import 'package:cuan/models/transaction_model.dart';
import 'package:cuan/shared/animation.dart';
import 'package:cuan/shared/helper.dart';
import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/widgets/dialog.dart';
import 'package:cuan/ui/widgets/home_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: whiteColor,
        actions: [IconButton(onPressed: () {}, icon: const ImageIcon(AssetImage('assets/ic_slider.png')))],
        
      ),
      body: BlocProvider(
        create: (context) => TransactionBloc()..add(const TransactionGet(0)),
        child: SafeArea(child: BlocBuilder<TransactionBloc, TransactionState>(
          builder: (context, state) {
            if (state is TransactionLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: orangeColor,
                ),
              );
            }
            if (state is TransactionHistorySuccess) {
              return ListView(
                padding: const EdgeInsets.symmetric( horizontal: 24,),
                children: [
                  CustomAnimation(
                    delay: 1,
                    child: Column(
                      children: state.grupData.entries
                          .map((data) => sectionLatestTransaction(
                              state.grupData.entries.toList().indexOf(data), data.key, data.value, context))
                          .toList(),
                    ),
                  )
                ],
              );
            }
            return const Center(
              child: Text('Not Histories'),
            );
          },
        )),
      ),
    );
  }

  Widget sectionLatestTransaction(int index, String date, List<TransactionModel> listData, BuildContext context) {
    return CustomAnimation(
      delay: double.parse('${3 + index}.0'),
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 13),
                decoration: BoxDecoration(color: whiteColor, 
                boxShadow: lightShadow,
                borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: listData.map((data) {
                    return GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => HistoryDialog(
                                    data: data,
                                  ));
                        },
                        child: HomeLatestTransactionItem(data: data));
                  }).toList(),
                )),
          ],
        ),
      ),
    );
  }
}

class HistoryDialog extends StatelessWidget {
  final TransactionModel data;

  const HistoryDialog({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return CustomDialog(
        isDetail: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/ic_history.png',
                  width: 20,
                  color: orangeColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(data.transactionType!.name!.toUpperCase(),
                    style: orangeTextStyle.copyWith(fontSize: 18, fontWeight:semiBold)),
              ],
            ),
            const Spacer(),
            Text('Description', style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium)),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
              alignment: Alignment.center,
              color: yellowColor,
              child: Text(data.desc!, style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium)),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ammount', style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium)),
                Text(formatCurrency(data.amount!), style: orangeTextStyle.copyWith(fontSize: 16, fontWeight: semiBold)),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Time', style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium)),
                Text(formatTimeAndDate(date: DateTime.parse(data.createdAt!), formatDate: 'HH:mm'),
                    style: orangeTextStyle.copyWith(fontSize: 14, fontWeight: semiBold)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Date', style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium)),
                Text(formatTimeAndDate(date: DateTime.parse(data.createdAt!), formatDate: 'EEEE, dd MMM yyyy'),
                    style: orangeTextStyle.copyWith(fontSize: 14, fontWeight: semiBold)),
              ],
            ),
          ],
        ));
  }
}
