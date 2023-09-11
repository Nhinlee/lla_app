import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/presentation.dart';
import 'package:redux/redux.dart';

class SplashScreen<T extends AppState> extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState<T>();
}

class _SplashScreenState<T extends AppState> extends State<SplashScreen> {
  String _statusId = '';
  late Store<T> _store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _store = StoreProvider.of<T>(context);

    final action = VerifyAccessTokenAction();
    setState(() {
      _statusId = action.statusId;
    });

    _store.dispatch(action);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppStatusListener<T>(
          statusId: _statusId,
          loadingPlaceHolder: const AppCircleLoading(),
          onSuccess: (status) {
            context.pushReplacementNamed(
              AppRoutes.homeScreen,
            );
          },
          onError: (message) {
            context.pushReplacementNamed(
              AppRoutes.loginScreen,
            );
          }),
    );
  }
}
