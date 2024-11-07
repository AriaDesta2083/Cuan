import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/widgets/buttons.dart';
import 'package:cuan/ui/widgets/more_items.dart';
import 'package:cuan/ui/widgets/text_fields.dart';
import 'package:flutter/material.dart';

class DataPackagePage extends StatelessWidget {
  const DataPackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paket Data'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Phone Number',style: blackTextStyle.copyWith(fontWeight: semiBold,fontSize: 16),),
            const SizedBox(
              height: 10,
            ),
            const CustomTextField(
              title: '+628',
              outTitle: false,
            ),
            const SizedBox(
              height: 30,
            ),
            Text('Select Package',style: blackTextStyle.copyWith(fontWeight: semiBold,fontSize: 16),),
            const SizedBox(
              height: 10,
            ),
            const Expanded(child: SingleChildScrollView(
              child: Wrap(
                children: [
                  PackageItem(name: '10 GB', price: 218000),
                  PackageItem(name: '25 GB', price: 218000),
                  PackageItem(name: '40 GB', price: 218000),
                  PackageItem(name: '99 GB', price: 218000,isSelect: true,),
                  PackageItem(name: '111 GB', price: 218000),
                ],
              ),
            )),        
            CustomFilledButton(title: 'Continue',onTaps: () async {
              if(await Navigator.pushNamed(context, '/pin') == true){
                Navigator.pushNamed(context, '/data-package-success');
              }
            },)
            ],

        ),
      ),
    );
  }

}