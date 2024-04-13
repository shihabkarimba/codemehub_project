import 'package:flutter/material.dart';

import '../../Widgets/textfield_widget.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hi there',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            Text(
              'Sign Up with your credentials...',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Form(
              child: Column(
                children: [
                  TextFormFieldWidget(
                    prefix: const Icon(Icons.account_box),
                    hintText: 'Full name',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormFieldWidget(
                    prefix: const Icon(Icons.account_box),
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormFieldWidget(
                    prefix: const Icon(Icons.password),
                    keyboardType: TextInputType.text,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  TextFormFieldWidget(
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
                onPressed: () {},
                child: Text('Sign Up'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20, top: 10),
              height: 0.5,
              width: double.infinity,
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                SizedBox(width: 3),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login',
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
