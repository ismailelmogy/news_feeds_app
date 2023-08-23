import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_colors.dart';
import 'app_strings.dart';

class Commons {
  static void showErrorDialog(
    BuildContext context,
    String message,
  ) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        content: Text(
          message,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: AppStrings.fontName),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            textStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: AppStrings.fontName,
                fontSize: 14),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  static void showToast(
      {required String message, Color? color, ToastGravity? gravity}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity ?? ToastGravity.BOTTOM,
      backgroundColor: color ?? AppColors.primaryColor,
    );
  }

  static Future<void> openUrl(String urlLink) async {
    final Uri url = Uri.parse(urlLink);
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  static dynamic decodeJson(Response<dynamic> response) {
    var responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }

  static Future showBottomSheet<T>({
    required BuildContext context,
    required Widget child,
  }) =>
      showModalBottomSheet(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
          elevation: 1,
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.white,
          builder: (context) => child);

  static String formatDate(String inputDateString) {
    DateTime dateTime = DateTime.parse(inputDateString);
    String month = getMonthName(dateTime.month);
    String day = dateTime.day.toString();
    String year = dateTime.year.toString();

    return "$month $day, $year";
  }

  static String getMonthName(int month) {
    switch (month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        return "";
    }
  }
}
