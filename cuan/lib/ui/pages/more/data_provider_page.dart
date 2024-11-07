import 'package:cuan/service/custom_width_height.dart';
import 'package:cuan/shared/helper.dart';
import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/widgets/buttons.dart';
import 'package:cuan/ui/widgets/more_items.dart';
import 'package:flutter/material.dart';

class DataProviderPage extends StatelessWidget {
  const DataProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beli Data'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'From Wallet',
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/img_wallet.png',
                  width: 80,
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '8002 2121 1234',
                      style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
                    ),
                    Text(
                      'Balance: ${formatCurrency(180000000)}',
                      style: greyTextStyle,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: getH(context, 30),
            ),
            Text(
              'Select Provider',
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 13,
            ),
            const Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  DataProviderItem(imgUrl: 'assets/img_provider_telkomsel.png', name: 'Telkomsel', status: 'Available'),
                  DataProviderItem(imgUrl: 'assets/img_provider_indosat.png', name: 'Indosat Ooredoo', status: 'Available',isSelected: true,),
                  DataProviderItem(imgUrl: 'assets/img_provider_singtel.png', name: 'Singtel ID', status: 'Available'),
                ],
              ),
            )),
            CustomFilledButton(title: 'Continue',onTaps: () {
             Navigator.pushNamed(context, '/data-package'); 
            },),
          ],
        ),
      ),
    );
  }
}
