import 'package:cuan/blocs/auth/auth_bloc.dart';
import 'package:cuan/blocs/dataplan/dataplan_bloc.dart';
import 'package:cuan/models/data_plan_model.dart';
import 'package:cuan/models/user_model.dart';
import 'package:cuan/ui/animations/animation.dart';
import 'package:cuan/shared/helper.dart';
import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/widgets/buttons.dart';
import 'package:cuan/ui/widgets/more_items.dart';
import 'package:cuan/ui/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataPlanPage extends StatefulWidget {
  final List<DataPlanModel> listData;
  const DataPlanPage({super.key, required this.listData});

  @override
  State<DataPlanPage> createState() => _DataPlanPageState();
}

class _DataPlanPageState extends State<DataPlanPage> {
  final numCtrl = TextEditingController(text: '+62');
  UserModel? auth;
  DataPlanModel? selectData;

  bool validate() {
    if (numCtrl.text.length > 10 && numCtrl.text.length < 15) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      setState(() {
        auth = authState.data;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paket Data'),
      ),
      body: BlocProvider(
        create: (context) => DataplanBloc(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Phone Number',
                style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                title: '+62',
                keyboardType: TextInputType.phone,
                outTitle: false,
                ctrl: numCtrl,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(15),
                ],
                onFieldSubmitted: (val) {
                  setState(() {
                    validate();
                  });
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Select Package',
                style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  alignment: WrapAlignment.center,
                  children: widget.listData
                      .map((data) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectData = data;
                              });
                            },
                            child: CustomAnimation(
                                delay: 1,
                                child: DataPlanItem(
                                  data: data,
                                  isSelect: (selectData?.id == data.id),
                                )),
                          ))
                      .toList(),
                ),
              )),
              BlocConsumer<DataplanBloc, DataplanState>(
                listener: (context, state) {
                  if (state is DataplanFailed) {
                    showCustomSnackbar(context, state.e);
                  }
                  if (state is DataplanBuySuccess) {
                    Navigator.pushNamed(context, '/data-plans-success');
                  }
                },
                builder: (context, state) {
                  if (selectData != null && validate()) {
                    return CustomFilledButton(
                      title: 'Continue',
                      onTaps: () async {
                        if (await Navigator.pushNamed(context, '/pin') == true) {
                          final String phone = numCtrl.text.replaceAll('+62', '0');
                          DataFormModel dataForm =
                              DataFormModel(dataPlanId: selectData?.id.toString(), pin: auth?.pin, phoneNumber: phone);
                          context.read<DataplanBloc>().add(DataPlanBuy(dataForm));
                        }
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
