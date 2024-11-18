import 'package:cuan/blocs/auth/auth_bloc.dart';
import 'package:cuan/blocs/dataplan/dataplan_bloc.dart';
import 'package:cuan/models/data_plan_model.dart';
import 'package:cuan/service/custom_width_height.dart';
import 'package:cuan/ui/animations/animation.dart';
import 'package:cuan/shared/helper.dart';
import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/pages/more/data_plan_page.dart';
import 'package:cuan/ui/widgets/buttons.dart';
import 'package:cuan/ui/widgets/more_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataProviderPage extends StatefulWidget {
  const DataProviderPage({super.key});

  @override
  State<DataProviderPage> createState() => _DataProviderPageState();
}

class _DataProviderPageState extends State<DataProviderPage> {
  DataProviderModel? selectData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beli Data'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              return Column(
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
                            state.data.cardNumber?.replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ") ??
                                'null',
                            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                          ),
                          Text(
                            'Balance: ${formatCurrency(state.data.balance ?? 0)}',
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
                  BlocProvider(
                    create: (context) => DataplanBloc()..add(DataPlanProvider()),
                    child: Expanded(child: BlocBuilder<DataplanBloc, DataplanState>(
                      builder: (context, state) {
                        if (state is DataplanProviderSuccess) {
                          return SingleChildScrollView(
                            child: Column(
                                children: state.listData
                                    .map((data) => GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectData = data;
                                          });
                                        },
                                        child: CustomAnimation(
                                            delay: 1,
                                            child: DataProviderItem(
                                              data: data,
                                              isSelected: (selectData?.id == data.id),
                                            ))))
                                    .toList()),
                          );
                        }
                        if (state is DataplanLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: orangeColor,
                            ),
                          );
                        }
                        if (state is DataplanFailed) {
                          return Center(
                            child: Text(state.e),
                          );
                        }
                        return const SizedBox(
                          height: 0.0,
                        );
                      },
                    )),
                  ),
                  (selectData != null)
                      ? CustomFilledButton(
                          title: 'Continue',
                          onTaps: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DataPlanPage(listData: selectData!.dataPlans!)));
                          },
                        )
                      : const SizedBox(
                          height: 0.0,
                        )
                ],
              );
            }
            return const SizedBox(
              height: 0.0,
            );
          },
        ),
      ),
    );
  }
}
