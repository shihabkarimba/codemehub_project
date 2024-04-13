import 'package:codemehub_project/Screens/Pages/nave_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Domain/Riverpod/AuthProvider/auth_provider.dart';
import '../../Domain/Riverpod/AuthProvider/auth_state.dart';
import '../../Widgets/textfield_widget.dart';
import '../Pages/home_page.dart';
import '../Pages/signup_page.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome back!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const Text(
              'Login with your credentials...',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormFieldWidget(
                    controller: email,
                    prefix: const Icon(Icons.account_box),
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormFieldWidget(
                    controller: password,
                    prefix: const Icon(Icons.password),
                    keyboardType: TextInputType.text,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await ref
                        .read(authProvider.notifier)
                        .loginUser(email.text, password.text)
                        .then((value) {
                      if (value == true) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => NavPage()));
                      }
                      if (value == false || value == null) {
                        return null;
                      }
                    });
                  }
                },
                child: switch (ref.watch(authProvider)) {
                  AuthLoadingState() => const Padding(
                      padding: EdgeInsets.all(3),
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                  _ => const Text(
                      'Sign In',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 10),
              height: 0.5,
              width: double.infinity,
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                const SizedBox(width: 3),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                    );
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
