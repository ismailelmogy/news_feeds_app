import 'package:flutter/material.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/hex_color.dart';
import '../../../../core/widgets/app_drawer.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      centerTitle: false,
      backgroundColor: HexColor("#141414"),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => _scaffoldKey.currentState!.openDrawer(),
      ),
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
        " Gallery ",
        style: TextStyle(
            fontWeight: FontWeight.w500, color: Colors.white, fontSize: 18),
      ),
    );
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(
        closeDrawer: () => _scaffoldKey.currentState!.closeDrawer(),
      ),
      backgroundColor: HexColor("#eeeeee"),
      appBar: appBar,
    ));
  }
}
