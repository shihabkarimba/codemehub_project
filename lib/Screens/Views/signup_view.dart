import 'package:codemehub_project/Screens/Pages/nav_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../Domain/Riverpod/AuthProvider/auth_provider.dart';
import '../../Domain/Riverpod/AuthProvider/auth_state.dart';
import '../../Widgets/textfield_widget.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final _formKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                ),
                const Text(
                  'Hi there',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                const Text(
                  'Sign Up with your credentials...',
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
                        validator: (context, val) {
                          if (val!.length < 6) {
                            return 'Password must have more than 6 letters';
                          }
                          return null;
                        },
                        controller: password,
                        prefix: const Icon(Icons.password),
                        keyboardType: TextInputType.text,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                      TextFormFieldWidget(
                        controller: confirmPassword,
                        validator: (context, val) {
                          if (val != password.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        prefix: const Icon(Icons.password),
                        keyboardType: TextInputType.text,
                        hintText: 'Confirm Password',
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
                            .signUpUser(
                                email: email.text, password: password.text)
                            .then(
                          (value) {
                            if (value == true) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => const NavPage()),
                                  (route) => false);
                              final Box storage = Hive.box('Storage');
                              storage.put('isUserAuthenticated', true);
                            }
                            if (value == false || value == null) {
                              return null;
                            }
                          },
                        );
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
                          'Sign Up',
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
                    const Text("Already have an account?"),
                    const SizedBox(width: 3),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
