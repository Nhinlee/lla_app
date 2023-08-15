import 'package:flutter/material.dart';
import 'package:lla_app/presentation.dart';

class LLAApp extends StatefulWidget {
  const LLAApp({Key? key}) : super(key: key);

  @override
  State<LLAApp> createState() => _LLAAppState();
}

class _LLAAppState extends State<LLAApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'LLA App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Colors.purple,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.purple,
          shadowColor: Colors.transparent,
        ),
      ),
      routerConfig: appRouter,
    );
  }
}
