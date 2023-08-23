import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/emagazine/presentation/screens/emagazine_screen.dart';
import '../../features/gallery/presentation/screens/gallery_screen.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';
import '../../features/live_chat/presentation/screens/live_chat_screen.dart';
import '../../features/wish_list/presentation/screens/wish_list_screen.dart';
import '../../core/utils/app_strings.dart';
import '../../injection_container.dart' as di;
import '../../features/home/presentation/screens/home_screen.dart';

class Routes {
  static const mainRoute = '/';
  static const liveChatRoute = '/liveChat';
  static const galleryRoute = '/gallery';
  static const wishListRoute = '/wishList';
  static const emagazineRoute = '/emagazine';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => di.serviceLocator<HomeBloc>(),
                child: const HomeScreen()));

      case Routes.liveChatRoute:
        return MaterialPageRoute(builder: (_) => const LiveChatScreen());

      case Routes.galleryRoute:
        return MaterialPageRoute(builder: (_) => const GalleryScreen());

      case Routes.wishListRoute:
        return MaterialPageRoute(builder: (_) => const WishListScreen());

      case Routes.emagazineRoute:
        return MaterialPageRoute(builder: (_) => const EmagazineScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
