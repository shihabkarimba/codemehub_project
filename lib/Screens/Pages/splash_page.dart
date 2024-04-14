import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../Views/splash_view.dart';
import 'login_page.dart';
import 'nav_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToNextScreen();
  }

  Future<void> navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulating a delay
    final isUserAuthenticated =
        Hive.box('Storage').get('isUserAuthenticated', defaultValue: false);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>
            isUserAuthenticated ? const NavPage() : const LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashView(),
    );
  }
}
