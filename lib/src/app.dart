import 'package:flutter/material.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';

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
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: appTheme(),
    );
  }
}
