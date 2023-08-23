import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/routes/app_routes.dart';

import '../entities/drawer_item.dart';
import '../utils/app_images.dart';

part 'drawer_event.dart';
part 'drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc() : super(DrawerInitial()) {
    on<ChangeDrawerIndexEvent>(changeDrawerIndex);
  }

  List<DrawerItem> drawerItems = [
    DrawerItem(
        title: "Explore",
        imgPath: AppImages.explore,
        isSelected: true,
        routeNavigation: Routes.mainRoute),
    DrawerItem(
        title: "Live Chat",
        imgPath: AppImages.live,
        routeNavigation: Routes.liveChatRoute),
    DrawerItem(
        title: "Gallery",
        imgPath: AppImages.gallery,
        routeNavigation: Routes.galleryRoute),
    DrawerItem(
        title: "Wish List",
        imgPath: AppImages.wishlist,
        routeNavigation: Routes.wishListRoute),
    DrawerItem(
        title: "E-Magazine",
        imgPath: AppImages.emagazine,
        routeNavigation: Routes.emagazineRoute)
  ];

  Future<void> changeDrawerIndex(
    ChangeDrawerIndexEvent event,
    Emitter<DrawerState> emit,
  ) async {
    emit(DrawerInitial());
    for (DrawerItem drawerItem in drawerItems) {
      drawerItem.isSelected = false;
    }
    drawerItems[event.index].isSelected = true;
    emit(DrawerIndexChanged());
  }
}
