import 'package:cuan/ui/animations/animation.dart';
import 'package:cuan/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final Widget child;
  final bool isDark;
  final bool isDetail;
  const CustomDialog({super.key, required this.child,this.isDark = false,this.isDetail =false});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: isDark ? Colors.black:Colors.transparent,
        alignment: Alignment.bottomCenter,
        content: CustomAnimation(
            delay: 1,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: isDetail? 280:200,
                padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 25),
                decoration: BoxDecoration(color: isDark ? Colors.black26 :  lightBackgroundColor , borderRadius: BorderRadius.circular(25)),
                child: child)));
  }
}
