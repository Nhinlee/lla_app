import 'package:flutter/material.dart';
import 'package:lla_app/presentation.dart';

class AppCircleLoading extends StatelessWidget {
  final double size;
  final double padding;
  final bool isCenter;

  const AppCircleLoading({
    Key? key,
    this.size = 32,
    this.padding = 0,
    this.isCenter = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isCenter) {
      return Padding(
        padding: EdgeInsets.all(padding),
        child: SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            strokeWidth: 4,
            backgroundColor: AppColors.white,
          ),
        ),
      );
    }

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
