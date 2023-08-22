import 'package:flutter/material.dart';
import 'package:news_feeds_app/src/core/utils/hex_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(backgroundColor: HexColor("#141414"));
    return SafeArea(child: Scaffold(appBar: appBar));
  }
}
