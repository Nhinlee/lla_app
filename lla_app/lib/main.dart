import 'package:flutter/material.dart';
import 'package:lla_app/presentation.dart';
import 'package:lla_app/repository.dart';
import 'package:lla_app/src/di/di.dart';
import 'package:redux/redux.dart';
import 'package:redux_simple/redux_simple.dart';

import 'business.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Init DI
  configureDependencies();
  final appInjector = getAppInjector();

  // Setup repository
  AppRepo.repo = appInjector.appRepository;

  // Init state
  final appState = AppState.initial();

  // Init store
  final store = Store<AppState>(
    HandlerReducer<AppState>().createReducer(),
    initialState: appState,
    middleware: [
      HandlerMiddleware<AppState>(),
    ],
  );

  // Setup interceptor
  appInjector.dio.interceptors.add(
    TokenInterceptors(
      store: store,
    ),
  );

  runApp(const LLAApp());
}
