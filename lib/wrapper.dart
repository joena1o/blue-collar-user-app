import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
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
