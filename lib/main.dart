import 'package:blue_collar_app/core/app_routes.dart';
import 'package:blue_collar_app/core/config/get_it_setup.dart';
import 'package:blue_collar_app/features/user_app_features/person_information/bloc/personal_info_bloc.dart';
import 'package:blue_collar_app/features/user_app_features/person_information/data/personal_info_repository.dart';
import 'package:blue_collar_app/features/user_app_features/settings/bloc/theme_bloc.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/bloc/auth_bloc.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/data/repository/auth_repository.dart';
import 'package:blue_collar_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:blue_collar_app/core/config/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        BlocProvider<AuthBloc>(
          create: (BuildContext context) =>
              AuthBloc(authRepository: getIt<AuthRepository>()),
        ),
        BlocProvider<PersonalInfoBloc>(
          create: (BuildContext context) => PersonalInfoBloc(
              personalInfoRepository: getIt<PersonalInfoRepository>()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: router,
            scaffoldMessengerKey: rootScaffoldMessengerKey,
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
