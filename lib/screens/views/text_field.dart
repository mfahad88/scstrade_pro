import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  ValueChanged<String>? onChanged;
  TextInputType? keyboardType;
  GestureTapCallback? onTap;
  TextEditingController? controller;
  Textfield({super.key,this.onChanged,this.keyboardType,this.onTap,this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: Theme.of(context).textTheme.headlineMedium,
      keyboardType: keyboardType,
      onTap: onTap,
      onChanged: onChanged,
    );
  }
}
