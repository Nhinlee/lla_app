import 'package:flutter/material.dart';
import 'package:lla_app/presentation.dart';

class AppCircleLoading extends StatelessWidget {
  final double size;
  final double padding;

  const AppCircleLoading({
    Key? key,
    this.size = 32,
    this.padding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            strokeWidth: 4,
            backgroundColor: AppColors.white,
          ),
        ),
      ),
    );
  }
}
