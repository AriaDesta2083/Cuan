import 'package:cuan/blocs/auth/auth_bloc.dart';
import 'package:cuan/blocs/transfer/transfer_bloc.dart';
import 'package:cuan/models/transfer_model.dart';
import 'package:cuan/models/user_model.dart';
import 'package:cuan/service/custom_width_height.dart';
import 'package:cuan/shared/helper.dart';
import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/widgets/buttons.dart';
import 'package:cuan/ui/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TransferAmountPage extends StatefulWidget {
  final TransferModel data;
  const TransferAmountPage({super.key, required this.data});
  @override
  State<TransferAmountPage> createState() => _TransferAmountPageState();
}

class _TransferAmountPageState extends State<TransferAmountPage> {
  final TextEditingController numTec = TextEditingController(text: '0');
  UserModel? user;

  addNum(String num) {
    if (numTec.text == '0') {
      numTec.text == '';
    }
    setState(() {
      numTec.text = numTec.text + num;
    });
  }

  delNum() {
    if (numTec.text.isNotEmpty) {
      setState(() {
        numTec.text = numTec.text.substring(0, numTec.text.length - 1);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      user = authState.data;
    }
    numTec.addListener(() {
      if (numTec.text == '') {
        numTec.text = '0';
      }
      final text = numTec.text;
      numTec.value = numTec.value.copyWith(
          text: NumberFormat.currency(
        locale: 'id',
        decimalDigits: 0,
        symbol: '',
      ).format(int.parse(text.replaceAll('.', ''))));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      appBar: AppBar(
        backgroundColor: darkBackgroundColor,
        automaticallyImplyLeading: false,
        title: const Text('Total Amount'),
        titleTextStyle: whiteTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getW(context, 57)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: getW(context, 220),
                child: TextField(
                  controller: numTec,
                  style: orangeTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 30,
                  ),
                  decoration: InputDecoration(
                      enabled: false,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(
                          'Rp',
                          style: orangeTextStyle.copyWith(
                            fontWeight: light,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: greyColor)),
                      contentPadding: EdgeInsets.symmetric(horizontal: getW(context, 12), vertical: getH(context, 12))),
                ),
              ),
              SizedBox(
                height: getH(context, 66),
              ),
              Wrap(
                spacing: getW(context, 40),
                runSpacing: getH(context, 40),
                children: [
                  CustomNumberButton(
                    num: '1',
                    onTaps: () {
                      addNum('1');
                    },
                  ),
                  CustomNumberButton(
                    num: '2',
                    onTaps: () {
                      addNum('2');
                    },
                  ),
                  CustomNumberButton(
                    num: '3',
                    onTaps: () {
                      addNum('3');
                    },
                  ),
                  CustomNumberButton(
                    num: '4',
                    onTaps: () {
                      addNum('4');
                    },
                  ),
                  CustomNumberButton(
                    num: '5',
                    onTaps: () {
                      addNum('5');
                    },
                  ),
                  CustomNumberButton(
                    num: '6',
                    onTaps: () {
                      addNum('6');
                    },
                  ),
                  CustomNumberButton(
                    num: '7',
                    onTaps: () {
                      addNum('7');
                    },
                  ),
                  CustomNumberButton(
                    num: '8',
                    onTaps: () {
                      addNum('8');
                    },
                  ),
                  CustomNumberButton(
                    num: '9',
                    onTaps: () {
                      addNum('9');
                    },
                  ),
                  SizedBox(width: getW(context, 60), height: getH(context, 60)),
                  CustomNumberButton(
                    num: '0',
                    onTaps: () {
                      addNum('0');
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      delNum();
                    },
                    child: Container(
                        width: getW(context, 60),
                        height: getH(context, 60),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: numberBackgroundColor),
                        child: Icon(
                          Icons.arrow_back,
                          size: 22,
                          color: whiteColor,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: getH(context, 50),
              ),
              CustomFilledButton(
                title: 'Continue',
                onTaps: () {
                  int totalAmount = int.parse(numTec.text.replaceAll('.', ''));
                  if (totalAmount >= 10000) {
                    showDialog(
                        context: context,
                        builder: (context) => TransferDialog(
                              data: widget.data.copyWith(
                                amount: totalAmount.toString(),
                                pin: user!.pin,
                              ),
                              user: user!,
                            ));
                  } else {
                    showCustomSnackbar(context, 'Minimum top up is IDR 10.0000');
                  }
                },
              ),
              SizedBox(
                height: getH(context, 25),
              ),
              const CustomTextButton(title: 'Terms & Conditions')
            ],
          ),
        ),
      ),
    );
  }
}

class TransferDialog extends StatelessWidget {
  final TransferModel data;
  final UserModel user;
  const TransferDialog({super.key, required this.data, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransferBloc(),
      child: CustomDialog(
        isDark: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/ic_wallet.png',
              width: 24,
              color: orangeColor,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    "Transfer to @${data.sendTo}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                  ),
                  Text(
                    "Total amount : ${formatCurrency(int.parse(data.amount!))}",
                    style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                  ),
                  const Spacer()
                ],
              ),
            ),
            BlocConsumer<TransferBloc, TransferState>(
              listener: (context, state) {
                if (state is TransferFailed) {
                  showCustomSnackbar(context, state.e);
                }
                if (state is TransferSuccess) {
                  Navigator.pushNamedAndRemoveUntil(context, '/transfer-success', (context) => false);
                }
              },
              builder: (context, state) {
                if (state is TransferLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: orangeColor,
                    ),
                  );
                }
                return CustomFilledButton(
                  title: 'Transfer',
                  onTaps: () async {
                    if (await Navigator.pushNamed(context, '/pin') == true) {
                      context.read<TransferBloc>().add(TransferPost(data));
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
