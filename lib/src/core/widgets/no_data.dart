import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class NoData extends StatelessWidget {
  final String? message;
  final double height;
  const NoData({Key? key, this.message, this.height = 250}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Icon(
          Icons.not_interested,
          size: 60,
          color: AppColors.primaryColor,
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            message ?? "No Data",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15),
          ),
        ),
      ],
    ));
  }
}
