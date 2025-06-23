import 'package:flutter/material.dart';
import 'package:winnipos/shared/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreenColor,
      body: Center(
        child: Container(
            width: 175,
            height: 70,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/logos/winnipos_logo.png'),
              ),
            ),
          ),
      ),
    );
  }
}