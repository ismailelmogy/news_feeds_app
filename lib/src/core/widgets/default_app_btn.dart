import 'package:flutter/material.dart';

import '../utils/hex_color.dart';

class DefaultAppBtn extends StatelessWidget {
  final String btnLbl;
  final Color btnLblColor;
  final TextStyle? btnStyle;
  final Widget? icon;
  final double? height;
  final bool enableMargin;
  final Color btnBackgroundColor;
  final Color borderColor;
  final VoidCallback onPressed;
  final BorderRadiusGeometry borderRadius;

  const DefaultAppBtn(
      {Key? key,
      this.height,
      required this.btnLbl,
      this.btnStyle,
      this.borderColor = const Color(0xFFF8D25C),
      this.btnBackgroundColor = const Color(0xFFF8D25C),
      this.enableMargin = true,
      required this.onPressed,
      this.btnLblColor = Colors.white,
      this.borderRadius = const BorderRadius.all(Radius.circular(14.0)),
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        height: height ?? 56,
        width: constraints.maxWidth,
        margin: EdgeInsets.symmetric(horizontal: enableMargin ? 16 : 0),
        child: icon != null
            ? OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  backgroundColor: btnBackgroundColor,
                  shape: RoundedRectangleBorder(borderRadius: borderRadius),
                  side: BorderSide(
                    color: borderColor,
                  ),
                ),
                icon: icon!,
                onPressed: onPressed,
                label: Text(
                  btnLbl,
                  style: btnStyle ??
                      TextStyle(
                          color: HexColor('#151514'),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              )
            : OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: btnBackgroundColor,
                  shape: RoundedRectangleBorder(borderRadius: borderRadius),
                  side: BorderSide(
                    color: borderColor,
                  ),
                ),
                onPressed: onPressed,
                child: Text(
                  btnLbl,
                  style: btnStyle ??
                      TextStyle(
                          color: HexColor('#151514'),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
      );
    });
  }
}
