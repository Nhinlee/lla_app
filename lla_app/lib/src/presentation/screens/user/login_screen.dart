import 'package:flutter/material.dart';
import 'package:lla_app/presentation.dart';
import 'package:lla_app/res/flutter_gen/assets.gen.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              const SizedBox(height: 20),
              SizedBox(
                width: 400,
                height: 400,
                child: Lottie.asset(
                  Assets.animations.flashCard,
                  fit: BoxFit.cover,
                ),
              ),
              AppRoundedTextField(
                controller: _emailTextController,
                labelText: 'Email',
              ),
              const SizedBox(height: 20),
              AppRoundedTextField(
                controller: _passwordTextController,
                labelText: 'Password',
              ),
              const SizedBox(height: 20),
              // Build the forgot password button on the right
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              AppRectButton(
                text: 'Login',
                onPressed: onLogin,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onLogin() {
    final email = _emailTextController.text;
    final password = _passwordTextController.text;

    if (email.isEmpty || password.isEmpty) {
      return;
    }
    //
    // final loginAction = LoginAction(
    //   email: email,
    //   password: password,
    // );
  }
}
