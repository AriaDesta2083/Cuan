import 'package:cuan/service/custom_width_height.dart';
import 'package:cuan/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final bool pass;
  final bool isPin;
  final bool outTitle;
  final TextEditingController? ctrl;
  final TextInputType? keyboardType;
  final Function(String)? onFieldSubmitted;

  const CustomTextField({super.key, required this.title, this.pass = false, this.outTitle = true, this.ctrl,this.keyboardType,this.isPin = false,this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (outTitle)
          Padding(
            padding: EdgeInsets.only(bottom: getW(context, 8)),
            child: Text(
              title,
              style: blackTextStyle.copyWith(fontWeight: medium),
            ),
          ),
        TextFormField(
          obscureText: pass,
          controller: ctrl,
          keyboardType: keyboardType,
          onFieldSubmitted: onFieldSubmitted ,
          inputFormatters: isPin?  [
                LengthLimitingTextInputFormatter(6),
              ]: null ,
          decoration: InputDecoration(
              hintText: !outTitle ? title :null,
              hintStyle: greyTextStyle,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(14),borderSide: BorderSide(width: 1,color: greyColor)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14),borderSide: BorderSide(width: 1,color: greyColor)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14),borderSide: BorderSide(width: 1,color: orangeColor)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
        )
      ],
    );
  }
}
