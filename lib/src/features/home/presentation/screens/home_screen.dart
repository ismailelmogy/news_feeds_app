import 'package:flutter/material.dart';
import 'package:news_feeds_app/src/core/utils/app_images.dart';
import 'package:news_feeds_app/src/core/utils/hex_color.dart';
import 'package:news_feeds_app/src/features/home/presentation/widgets/article_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      centerTitle: false,
      backgroundColor: HexColor("#141414"),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Image.asset(
            AppImages.search,
            height: 24,
            width: 24,
          ),
          onPressed: () {},
        ),
      ],
      title: const Text(
        "LINK DEVELOPMENT",
        style: TextStyle(
            fontWeight: FontWeight.w500, color: Colors.white, fontSize: 18),
      ),
    );
    return SafeArea(
        child: Scaffold(
      backgroundColor: HexColor("#eeeeee"),
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ArticleWidget();
            }),
      ),
    ));
  }
}
