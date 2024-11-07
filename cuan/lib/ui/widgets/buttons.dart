import 'package:cuan/service/custom_width_height.dart';
import 'package:cuan/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback? onTaps;

  const CustomFilledButton({
    super.key,
    required this.title,
    this.width = double.infinity,
    this.height = 50,
    this.onTaps,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getW(context,width),
      height: getH(context, height),
      child: TextButton(
        onPressed: onTaps,
        style: TextButton.styleFrom(
            backgroundColor: orangeColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(56))),
        child: Text(
          title,
          style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTaps;
  const CustomTextButton({super.key, required this.title, this.onTaps});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTaps,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Text(
        title,
        style: greyTextStyle.copyWith(fontSize: 16),
      ),
    );
  }
}


class CustomNumberButton extends StatelessWidget {
  final String num;
  final VoidCallback? onTaps;
  const CustomNumberButton({super.key, required this.num, this.onTaps});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTaps,      
      child: Container(
        width: getW(context, 60),
        height: getH(context, 60),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: numberBackgroundColor
        ),
        child: Center(
          child: Text(num, style: whiteTextStyle.copyWith(fontSize: 22,fontWeight: semiBold),),
        ),
      ),
    );
  }
}