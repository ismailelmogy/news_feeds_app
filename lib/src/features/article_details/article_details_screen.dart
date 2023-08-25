import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/media_query_values.dart';
import '../home/domain/entities/article.dart';
import '../../core/utils/app_images.dart';
import '../../core/utils/commons.dart';
import '../../core/utils/hex_color.dart';

class ArticleDetailsScreen extends StatefulWidget {
  final Article article;
  const ArticleDetailsScreen({super.key, required this.article});

  @override
  State<ArticleDetailsScreen> createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      centerTitle: false,
      backgroundColor: HexColor("#141414"),
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back)),
      actions: [
        IconButton(
          icon: Image.asset(
            AppImages.search,
            height: 22,
            width: 22,
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: widget.article.urlToImage,
                        height: 180,
                        width: context.width,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Image.asset(AppImages.placeholder),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      Positioned.fill(
                          bottom: 10,
                          right: 10,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              Commons.formatDate(widget.article.publishedAt),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.article.title,
                          style: TextStyle(
                              color: HexColor("#5e5e5e"), fontSize: 20),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        widget.article.author != null
                            ? Text(
                                "By ${widget.article.author}",
                                style: TextStyle(color: HexColor("#acacac")),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 16, left: 16, bottom: 30),
                    child: Text(
                      widget.article.description,
                      style: TextStyle(color: HexColor("#acacac"), height: 1.4),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
                style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    fixedSize: Size(context.width, 60),
                    backgroundColor: AppColors.primaryColor),
                onPressed: () => Commons.openUrl(widget.article.url),
                child: const Text(
                  "OPEN WEBSITE",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: 17),
                ))
          ],
        ),
      ),
    ));
  }
}
