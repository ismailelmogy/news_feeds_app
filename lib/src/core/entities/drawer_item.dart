class DrawerItem {
  final String title;
  final String imgPath;
  bool isSelected;
  final String routeNavigation;

  DrawerItem(
      {required this.title,
      required this.routeNavigation,
      required this.imgPath,
      this.isSelected = false});
}
