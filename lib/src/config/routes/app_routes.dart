import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_feeds_app/src/features/home/presentation/bloc/home_bloc.dart';
import '../../core/utils/app_strings.dart';
import 'package:news_feeds_app/src/injection_container.dart' as di;
import '../../features/home/presentation/screens/home_screen.dart';

class Routes {
  static const String mainRoute = '/';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => di.serviceLocator<HomeBloc>(),
                child: const HomeScreen()));

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
