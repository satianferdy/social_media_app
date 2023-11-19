import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/components/my_button.dart';
import 'package:social_media_app/components/my_textfield.dart';
import 'package:social_media_app/helper/helper_functions.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTab;

  const LoginPage({super.key, required this.onTab});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // login method
  void login() async {
    // show loading indicator
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // try signing in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // pop loading indicator
      if (context.mounted) {
        Navigator.pop(context);
      }

      // display any error message
    } on FirebaseAuthException catch (e) {
      // pop loading indicator
      Navigator.pop(context);
      // show error message
      displayErrorMessage(context, e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Icon(
                Icons.account_circle,
                size: 100,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),

              const SizedBox(height: 20),

              // app name
              Text(
                'M I N I S O C I A L',
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              const SizedBox(height: 30),

              // email textfield
              MyTextField(
                hintText: "Email",
                obscureText: false,
                controller: emailController,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                hintText: "Password",
                obscureText: true,
                controller: passwordController,
              ),

              const SizedBox(height: 10),

              // forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              //sign in button
              MyButton(
                text: "Sign In",
                onTap: login,
              ),

              const SizedBox(height: 20),

              // don't have an account? register here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTab,
                    child: const Text(
                      "Register here",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
