import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  final Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    // Build elevated button with circle shape
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
