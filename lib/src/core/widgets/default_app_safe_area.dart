import 'package:flutter/material.dart';

import '../utils/hex_color.dart';

class DefaultAppSafeArea extends StatelessWidget {
  final Widget child;
  const DefaultAppSafeArea({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: HexColor('#151514'),
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: child,
          ),
        ));
  }
}
