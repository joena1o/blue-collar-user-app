import 'package:blue_collar_app/core/app_routes.dart';
import 'package:blue_collar_app/features/user_app_features/settings/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:blue_collar_app/core/config/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            title: 'Blue Collar',
            theme: (state is ThemeDark)
                ? MainAppTheme.darkTheme
                : MainAppTheme.lightTheme,
          );
        },
      ),
    );
  }
}
