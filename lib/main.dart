import 'package:blue_collar_app/core/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:blue_collar_app/core/config/app_theme.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Blue Collar',
      theme: MainAppTheme.lightTheme,
    );
  }
}
