import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final void Function(String) onSubmitted;

  AdaptativeTextfield({
    required this.controller,
    required this.label,
    required this.keyboardType,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            controller: controller,
            placeholder: label,
            keyboardType: keyboardType,
            onSubmitted: onSubmitted,
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
          )
        : TextField(
            controller: controller,
            decoration: InputDecoration(labelText: label),
            keyboardType: keyboardType,
            onSubmitted: onSubmitted,
          );
  }
}
