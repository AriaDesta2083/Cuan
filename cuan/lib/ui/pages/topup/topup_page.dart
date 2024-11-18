import 'package:cuan/blocs/auth/auth_bloc.dart';
import 'package:cuan/blocs/payment/payment_bloc.dart';
import 'package:cuan/models/payment_model.dart';
import 'package:cuan/models/topup_model.dart';
import 'package:cuan/service/custom_width_height.dart';
import 'package:cuan/ui/animations/animation.dart';
import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/pages/topup/topup_amount_page.dart';
import 'package:cuan/ui/widgets/bank_items.dart';
import 'package:cuan/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({super.key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  PaymentModel? selectPayment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Up'),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Wallet',
                    style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
                  ),
                  SizedBox(
                    height: getH(context, 10),
                  ),
                  Row(
                    children: [
                      Hero(
                        tag: 'card',
                        child: Image.asset(
                          'assets/img_wallet.png',
                          width: getW(context, 80),
                          height: getH(context, 55),
                        ),
                      ),
                      SizedBox(
                        width: getW(context, 16),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.data.cardNumber?.replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ") ??
                                'null',
                            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                          ),
                          Text(
                            state.data.name!,
                            style: greyTextStyle,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: getH(context, 40),
                  ),
                  Text(
                    'Select Bank',
                    style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
                  ),
                  SizedBox(
                    height: getH(context, 14),
                  ),
                  BlocProvider(
                    create: (context) => PaymentBloc()..add(PaymentMethodGet()),
                    child: BlocBuilder<PaymentBloc, PaymentState>(
                      builder: (context, state) {
                        if (state is PaymentSuccess) {
                          return Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                  children: state.listData
                                      .map((data) => GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectPayment = data;
                                              });
                                            },
                                            child: CustomAnimation(
                                              delay: double.parse('1.${((data.id))}'),
                                              child: BankItem(
                                                data: data,
                                                isSelect: selectPayment?.id == data.id,
                                              ),
                                            ),
                                          ))
                                      .toList()),
                            ),
                          );
                        }
                        if (state is PaymentLoading) {
                          return Expanded(
                              child: Center(
                            child: CircularProgressIndicator(
                              color: orangeColor,
                            ),
                          ));
                        }
                        if (state is PaymentFailed) {
                          return Expanded(child: Center(child: Text(state.e)));
                        }
                        return Container();
                      },
                    ),
                  ),
                  (selectPayment != null)
                      ? Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomAnimation(
                            delay: 0.5,
                            child: CustomFilledButton(
                              title: 'Continue',
                              onTaps: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TopupAmountPage(
                                                data: TopUpModel(
                                              paymentMethodCode: selectPayment?.code,
                                              pin: state.data.pin,
                                            ))));
                              },
                            ),
                          ),
                        )
                      : const SizedBox(
                          height: 0.0,
                        )
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}


// ** BCA Virtual Account: https://simulator.sandbox.midtrans.com/bca/va/index
// ** BRI Virtual Account: https://simulator.sandbox.midtrans.com/bri/va/index
// ** BNI Virtual Account: https://simulator.sandbox.midtrans.com/bni/va/index
