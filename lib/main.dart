import 'package:flutter/material.dart';
import 'package:winnipos/features/auth/presentation/pages/login_page.dart';
import 'package:winnipos/features/auth/presentation/pages/splash_page.dart';
import 'package:winnipos/features/home/presentation/pages/home_page.dart';
import 'shared/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: appTheme, debugShowCheckedModeBanner: false, routes: {
      '/': (context) => const SplashPage(),
      '/login': (context) => const LoginPage(),
      '/home': (context) => const HomePage(),
    },);
  }
}