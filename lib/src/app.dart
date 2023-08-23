import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/bloc/drawer_bloc.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'injection_container.dart' as di;

class NewsFeedsApp extends StatefulWidget {
  const NewsFeedsApp({
    Key? key,
  }) : super(key: key);
  @override
  State<NewsFeedsApp> createState() => _NewsFeedsAppState();
}

class _NewsFeedsAppState extends State<NewsFeedsApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.serviceLocator<DrawerBloc>()),
        ],
        child: MaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          theme: appTheme(),
        ));
  }
}
