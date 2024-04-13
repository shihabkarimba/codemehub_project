import 'package:flutter/material.dart';

import '../Views/signup_view.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpView(),
    );
  }
}
