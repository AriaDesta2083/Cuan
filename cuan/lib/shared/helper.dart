import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:cuan/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

Future<void> showCustomSnackbar(BuildContext context, String msg) async {
  await Flushbar(
    message: msg,
    flushbarPosition: FlushbarPosition.TOP,
    duration: const Duration(milliseconds: 1200),
    backgroundColor: redColor,
    boxShadows: lightShadow,
    dismissDirection: FlushbarDismissDirection.VERTICAL,
    flushbarStyle: FlushbarStyle.GROUNDED,
  ).show(context);
}

String formatCurrency(num number) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: 'IDR ',
    decimalDigits: 0,
  ).format(number);
}

String formatTransactionCurrency(num number) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: '',
    decimalDigits: 0,
  ).format(number);
}

String formatDate({DateTime? date, String formatDate = 'MMMM dd'}) {
  DateTime fixdate = date!.add(const Duration(hours: 7, seconds: 10));
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  DateTime yesterday = today.subtract(const Duration(days: 1));
  DateTime inputDate = DateTime(fixdate.year, fixdate.month, fixdate.day);

  if (inputDate == today) {
    return 'Today';
  } else if (inputDate == yesterday) {
    return 'Yesterday';
  } else {
    return DateFormat(formatDate).format(fixdate);
  }
}

String formatTimeAndDate({DateTime? date, String formatDate = 'MMMM dd'}) {
  DateTime fixdate = date!.add(const Duration(hours: 7, seconds: 10));
  return DateFormat(formatDate).format(fixdate);
}

Future<XFile?> selectImage() async {
  XFile? selectedImages = await ImagePicker().pickImage(source: ImageSource.gallery);
  return selectedImages;
}

// https://www.acethinker.com/screen-recorder-free
