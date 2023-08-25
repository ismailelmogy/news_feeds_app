import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/commons.dart';
import '../../../../core/utils/hex_color.dart';
import '../../../../core/utils/media_query_values.dart';
import '../../domain/entities/article.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;
  final AnimationController? animationController;
  final Animation<double>? animation;
  const ArticleWidget(
      {super.key,
      this.animationController,
      this.animation,
      required this.article});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
            opacity: animation!,
            child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 50 * (1.0 - animation!.value), 0.0),
                child: InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, Routes.articleDetailsRoute,
                        arguments: article),
                    child: Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            imageUrl: article.urlToImage,
                            height: 180,
                            width: context.width,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Image.asset(
                              AppImages.placeholder,
                              fit: BoxFit.cover,
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              AppImages.placeholder,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article.title,
                                  style: TextStyle(
                                      color: HexColor("#5e5e5e"), fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                article.author != null
                                    ? Text(
                                        "By ${article.author}",
                                        style: TextStyle(
                                            color: HexColor("#acacac")),
                                      )
                                    : const SizedBox.shrink(),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Spacer(),
                                    Text(
                                      Commons.formatDate(article.publishedAt),
                                      style:
                                          TextStyle(color: HexColor("#8a8a8a")),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))));
      },
    );
  }
}
