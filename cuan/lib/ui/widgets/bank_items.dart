import 'package:cuan/models/payment_model.dart';
import 'package:cuan/service/custom_width_height.dart';
import 'package:cuan/shared/theme.dart';
import 'package:flutter/material.dart';

class BankItem extends StatelessWidget {
  final PaymentModel data;
  final bool isSelect;
  const BankItem({super.key, required this.data, this.isSelect = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: EdgeInsets.all( isSelect? getW(context, 25) : getW(context, 20)),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelect ? lightShadow:null,
          border: Border.all(color: isSelect ? blueColor : whiteColor, width: 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            data.thumbnail!,
            width: isSelect? getW(context, 110):getW(context, 90),
            height: getH(context, 40),
            fit: BoxFit.fitWidth,            
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                data.name!,
                style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              Text(
                data.time!,
                style: greyTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
