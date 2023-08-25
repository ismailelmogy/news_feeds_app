import 'package:flutter/material.dart';

import '../entities/drawer_item.dart';
import '../utils/hex_color.dart';

class DrawerListTile extends StatelessWidget {
  final DrawerItem drawerItem;
  final VoidCallback onPress;
  const DrawerListTile({
    super.key,
    required this.onPress,
    required this.drawerItem,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: InkWell(
        splashColor: Colors.white,
        onTap: onPress,
        child: Row(
          children: [
            drawerItem.isSelected
                ? Container(
                    color: Colors.black,
                    width: 2,
                    height: 40,
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              width: 30,
            ),
            Image.asset(
              drawerItem.imgPath,
              height: 24,
              width: 24,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              drawerItem.title,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  color: HexColor("#141414")),
            ),
          ],
        ),
      ),
    );
  }
}
