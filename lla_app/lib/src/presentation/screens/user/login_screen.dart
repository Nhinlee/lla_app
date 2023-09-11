import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/presentation.dart';
import 'package:lla_app/res/flutter_gen/assets.gen.dart';
import 'package:lottie/lottie.dart';
import 'package:redux/redux.dart';

class LoginScreen<T extends AppState> extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState<T>();
}

class _LoginScreenState<T extends AppState> extends State<LoginScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  late Store<T> _store;
  String _statusId = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Just for testing
    _emailTextController.text = 'nhin@gmail.com';
    _passwordTextController.text = '123456';

    _store = StoreProvider.of<T>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppStatusListener(
        statusId: _statusId,
        loadingPlaceHolder: const AppCircleLoading(),
        onSuccess: (status) {
          navigateToHomeScreen();
        },
        onError: (message) {
          AppToast.showError(message);
        },
        builder: (status) => buildBody(),
      ),
    );
  }

  SafeArea buildBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
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
    );
  }

  void onLogin() {
    final email = _emailTextController.text;
    final password = _passwordTextController.text;

    if (email.isEmpty || password.isEmpty) {
      return;
    }

    final loginAction = LoginAction.from(
      email: email,
      password: password,
    );

    setState(() {
      _statusId = loginAction.statusId;
    });
    _store.dispatch(loginAction);
  }

  void navigateToHomeScreen() {
    context.pushReplacementNamed(
      AppRoutes.homeScreen,
    );
  }
}
