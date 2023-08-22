import 'package:flutter/material.dart';
import 'default_app_btn.dart';
import '../utils/app_colors.dart';
import '../utils/media_query_values.dart';

class ErrorWidget extends StatelessWidget {
  final String msg;
  final VoidCallback? onRetryPressed;
  const ErrorWidget({Key? key, required this.msg, this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Icon(
            Icons.warning_amber_rounded,
            color: AppColors.primaryColor,
            size: 120,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            msg,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: const Text(
              "Try Again",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            )),
        Container(
            width: context.width * 0.55,
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: DefaultAppBtn(
                btnLbl: "Reload Screen",
                onPressed: () {
                  if (onRetryPressed != null) {
                    onRetryPressed!();
                  }
                }))
      ],
    );
  }
}
