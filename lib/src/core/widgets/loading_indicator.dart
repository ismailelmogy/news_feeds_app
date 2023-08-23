import 'package:flutter/material.dart';
import '../utils/hex_color.dart';

class LoadingIndicator extends StatelessWidget {
  final double size;
  const LoadingIndicator({Key? key, this.size = 50}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: CircularProgressIndicator(
        color: HexColor("#141414"),
      )),
    );
  }
}
