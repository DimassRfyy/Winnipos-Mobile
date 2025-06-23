import 'package:flutter/material.dart';
import 'package:winnipos/shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Navigasi otomatis setelah 5 detik
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreenColor,
      body: Center(
        child: Container(
          width: 195,
          height: 90,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/logos/winnipos_logofull.png'),
            ),
          ),
        ),
      ),
    );
  }
}