import 'package:flutter/material.dart';

// ukuran figma = 375.0 x 812.0
double getW(BuildContext context, double w) {
  double widthScale = MediaQuery.of(context).size.width / 375.0;
  return w * widthScale;
}
double getH(BuildContext context, double h) {
  double heightScale = MediaQuery.of(context).size.height / 812.0;
  return h * heightScale;
}



