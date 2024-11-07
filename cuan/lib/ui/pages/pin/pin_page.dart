import 'package:cuan/blocs/auth/auth_bloc.dart';
import 'package:cuan/service/custom_width_height.dart';
import 'package:cuan/shared/helper.dart';
import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PinPage extends StatefulWidget {
  const PinPage({super.key});
  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController pinTEC = TextEditingController(text: '');
  String pin = '';
  bool isError = false;

  addPin(String num){
    if (pinTEC.text.length<6) {
      setState(() {
        pinTEC.text = pinTEC.text + num;
      });
    }
    if (pinTEC.text.length == 6 ){
      print(pin);
      if (pinTEC.text == pin) {
        Navigator.pop(context,true);
      }
      else{
        showCustomSnackbar(context, "PIN Uncorrect. Try again");
        setState(() {
          isError = true;
        });
      }
    }
  }

  delPin(){
    if(pinTEC.text.isNotEmpty){
      setState(() {
        pinTEC.text = pinTEC.text.substring(0,pinTEC.text.length -1);
        isError = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    final getBloc = context.read<AuthBloc>().state;
    if (getBloc is AuthSuccess) {
      pin = getBloc.data.pin!;
      print('cekpin $pin');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      appBar: AppBar(
        backgroundColor: darkBackgroundColor,
        automaticallyImplyLeading: false,
        title: const Text('PIN'),
        titleTextStyle: whiteTextStyle.copyWith(fontSize: 20,fontWeight: semiBold),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getW(context, 57)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                SizedBox(
                  width: getW(context, 200),
                  child:TextField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  controller: pinTEC,
                  style: redTextStyle.copyWith(fontWeight: medium,fontSize: 36,letterSpacing: 10,color: isError? redColor:orangeColor),
                  decoration: InputDecoration(
                    enabled: false,
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: isError?redColor:greyColor)
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: getW(context, 12), vertical: getH(context, 12))),
                          ),
                          ),
                SizedBox(
                  height: getH(context,66),
                ),
                Wrap(
                  spacing: getW(context, 40),
                  runSpacing: getH(context,40),
                  children: [
                    CustomNumberButton(num:'1',onTaps: (){
                      addPin('1');
                    },),
                    CustomNumberButton(num:'2',onTaps: (){
                      addPin('2');
                    },),
                    CustomNumberButton(num:'3',onTaps: (){
                      addPin('3');
                    },),
                    CustomNumberButton(num:'4',onTaps: (){
                      addPin('4');
                    },),
                    CustomNumberButton(num:'5',onTaps: (){
                      addPin('5');
                    },),
                    CustomNumberButton(num:'6',onTaps: (){
                      addPin('6');
                    },),
                    CustomNumberButton(num:'7',onTaps: (){
                      addPin('7');
                    },),
                    CustomNumberButton(num:'8',onTaps: (){
                      addPin('8');
                    },),
                    CustomNumberButton(num:'9',onTaps: (){
                      addPin('9');
                    },),
                    SizedBox(width: getW(context, 60), height: getH(context, 60)),
                    CustomNumberButton(num:'0',onTaps: (){
                      addPin('0');
                    },),
                    GestureDetector(
                      onTap: (){
                        delPin();
                      },
                      child: Container(
                        width: getW(context, 60),
                        height: getH(context, 60),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: numberBackgroundColor
                        ),
                        child: Icon(Icons.arrow_back,size: 22,color: whiteColor,)
                      ),
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}