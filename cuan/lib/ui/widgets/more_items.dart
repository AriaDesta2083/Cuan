import 'package:cuan/models/data_plan_model.dart';
import 'package:cuan/service/custom_width_height.dart';
import 'package:cuan/shared/helper.dart';
import 'package:cuan/shared/theme.dart';
import 'package:flutter/material.dart';

class DataProviderItem extends StatelessWidget {
  final DataProviderModel data;
  final bool isSelected;
  const DataProviderItem({super.key,required this.data,this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isSelected? 23:20),
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        boxShadow: lightShadow,
        border: isSelected
            ? Border.all(
                width: 2,
                color: blueColor,
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            data.thumbnail!,
            filterQuality: FilterQuality.high,
            height: isSelected?45:30,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                data.name??'',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                data.status??'',
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DataPlanItem extends StatelessWidget {
  final DataPlanModel data;
  final bool isSelect;
  const DataPlanItem({super.key, required this.data, this.isSelect = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getW(context,150),
      height: getH(context, 170),
      padding: EdgeInsets.symmetric(
        horizontal: isSelect?14:12,
        vertical: isSelect? 22:20,
      ),
      decoration: BoxDecoration(
        boxShadow: isSelect? lightShadow:null,
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelect ? blueColor : whiteColor,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data.name??'',
            style: blackTextStyle.copyWith(
              fontSize: isSelect? 34:32,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            formatCurrency(data.price??0),
            style: greyTextStyle.copyWith(
              fontSize: isSelect?14:12,
            ),
          ),
        ],
      ),
    );
  }
}