import 'package:flutter/material.dart';
import 'package:news_feeds_app/src/core/utils/hex_color.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
              "https://img-cdn.tnwcdn.com/image/tnw-blurple?filter_last=1&fit=1280%2C640&url=https%3A%2F%2Fcdn0.tnwcdn.com%2Fwp-content%2Fblogs.dir%2F1%2Ffiles%2F2023%2F06%2F70-kn-engine-1-1-1024x576-1-e1687258568667.jpg&signature=e504e335f8babf0e24721de9198d4fb6"),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rapid delivery giant Getir quits France, citing regulation hurdles",
                  style: TextStyle(color: HexColor("#5e5e5e"), fontSize: 20),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "By oanna Lykiardopoulou",
                  style: TextStyle(color: HexColor("#acacac")),
                ),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      "April 3 , 2017",
                      style: TextStyle(color: HexColor("#8a8a8a")),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
