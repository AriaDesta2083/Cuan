import 'package:cuan/models/transaction_model.dart';
import 'package:cuan/shared/helper.dart';
import 'package:cuan/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeServiceItem extends StatelessWidget {
  final String title;
  final String icUrl;
  final VoidCallback? onTaps;
  const HomeServiceItem({
    super.key,
    required this.title,
    required this.icUrl,
    this.onTaps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTaps,
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: whiteColor),
            child: Center(
              child: Image.asset(
                icUrl,
                width: 26,
                height: 26,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: blackTextStyle.copyWith(fontWeight: medium),
        )
      ],
    );
  }
}

class HomeLatestTransactionItem extends StatelessWidget {
  final TransactionModel data;

  const HomeLatestTransactionItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                // image: DecorationImage(image: NetworkImage(data.transactionType!.thumbnail!) as ImageProvider)),
                image: DecorationImage(
                    image: AssetImage(data.transactionType!.name! == 'Transfer'
                        ? 'assets/ic_transaction_cat3.png'
                        : 'assets/ic_transaction_cat1.png'))),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.transactionType!.name!,
                  style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  formatDate(date:DateTime.parse(data.createdAt!)),
                  style: greyTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            (data.transactionType?.action == 'cr' ? '+ ' : '- ') + formatTransactionCurrency(data.amount!),
            style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
          )
        ],
      ),
    );
  }
}

class HomeUsersItem extends StatelessWidget {
  final String username;
  final String? imgUrl;
  final VoidCallback? onTaps;

  const HomeUsersItem({super.key, required this.username, this.imgUrl, this.onTaps});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTaps,
      child: Container(
        margin: const EdgeInsets.only(right: 17),
        width: 100,
        height: 120,
        decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imgUrl == null ? const AssetImage('assets/img_profile.png') : NetworkImage(imgUrl!) as ImageProvider,
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              height: 13,
            ),
            Text(
              "@$username",
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: medium),
            )
          ],
        ),
      ),
    );
  }
}

class HomeTipsItem extends StatelessWidget {
  final String icUrl;
  final String title;
  const HomeTipsItem({super.key, required this.icUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 176,
      decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 155,
            height: 110,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                image: DecorationImage(image: AssetImage(icUrl), fit: BoxFit.cover)),
          ),
          Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                title,
                style: blackTextStyle.copyWith(fontWeight: medium),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ))
        ],
      ),
    );
  }
}

