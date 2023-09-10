import 'package:flutter/material.dart';

class AppRoundedTextField extends StatelessWidget {
  const AppRoundedTextField({
    super.key,
    required this.controller,
    this.labelText,
  });

  final TextEditingController controller;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: buildInputDecoration(
        labelText: labelText,
      ),
    );
  }

  InputDecoration buildInputDecoration({
    String? labelText,
  }) {
    return InputDecoration(
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      labelText: labelText,
    );
  }
}
