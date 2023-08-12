import 'package:flutter/material.dart';
import 'package:lla_app/presentation.dart';

class LLAApp extends StatelessWidget {
  const LLAApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LLA App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Learning items'),
        ),
        body: LearningItemsScreen(),
      ),
    );
  }
}
