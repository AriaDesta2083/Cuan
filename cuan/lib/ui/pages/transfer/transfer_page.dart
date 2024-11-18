import 'package:cuan/blocs/user/user_bloc.dart';
import 'package:cuan/models/transfer_model.dart';
import 'package:cuan/models/user_model.dart';
import 'package:cuan/service/custom_width_height.dart';
import 'package:cuan/ui/animations/animation.dart';
import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/pages/transfer/transfer_amount_page.dart';
import 'package:cuan/ui/widgets/buttons.dart';
import 'package:cuan/ui/widgets/text_fields.dart';
import 'package:cuan/ui/widgets/transfer_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  UserModel? selectUser;
  late UserBloc userBloc;
  final usrnmCtrl = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    userBloc = context.read<UserBloc>()..add(UserGetRecentUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
        backgroundColor:whiteColor,

      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getW(context, 24), vertical: getW(context, 24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Search',
                style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
              SizedBox(
                height: getH(context, 14),
              ),
              CustomTextField(
                title: 'by username',
                outTitle: false,
                ctrl: usrnmCtrl,
                onFieldSubmitted: (val) {
                  if (val.isEmpty) {
                    selectUser = null;
                    userBloc.add(UserGetRecentUser());
                  } else {
                    selectUser = null;
                    userBloc.add(UserGetByUsername(val));
                  }
                  setState(() {});
                },
              ),
              SizedBox(
                height: getH(context, 40),
              ),
              Text(
                (usrnmCtrl.text.isEmpty)? 'Recent Users':'Result User',
                style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
              SizedBox(
                height: getH(context, 14),
              ),
              Expanded(
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserSuccess) {
                      return SingleChildScrollView(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: (usrnmCtrl.text.isEmpty)
                              //* RECENT USER
                              ? Column(
                                  children: state.listData
                                      .map((data) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectUser = data;
                                            });
                                          },
                                          child: RecentUser(
                                            user: data,
                                            isSelect: selectUser?.id == data.id,
                                          )))
                                      .toList(),
                                )
                              //* RESULT USER
                              : Wrap(
                                  spacing: 15,
                                  runSpacing: 10,
                                  children: state.listData
                                      .map((data) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectUser = data;
                                            });
                                          },
                                          child: ResultUser(
                                            user: data,
                                            isSelect: selectUser?.id == data.id,
                                            isAny: state.listData.length > 1,
                                          )))
                                      .toList(),
                                ));
                    }
                    return Center(
                        child: CircularProgressIndicator(
                      color: orangeColor,
                    ));
                  },
                ),
              ),
              (selectUser != null)
                  ? CustomAnimation(
                    delay: 1,
                    child: CustomFilledButton(
                        title: 'Continue',
                        onTaps: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TransferAmountPage(
                                data: TransferModel(
                                  sendTo: selectUser!.username,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                  )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}


