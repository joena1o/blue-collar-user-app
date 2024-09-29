import 'dart:async';
import 'package:blue_collar_app/data/local_storage.dart';
import 'package:blue_collar_app/features/user_app_features/settings/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    SharedPrefService.getBoolItem("theme").then((value) {
      if (value != null) {
        BlocProvider.of<ThemeBloc>(context).add(ToggleTheme(isDark: !value));
      }
    });
    Timer(const Duration(seconds: 2), () {
      context.go("/onboarding");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("B",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 50))
          ],
        ),
      ),
    );
  }
}
