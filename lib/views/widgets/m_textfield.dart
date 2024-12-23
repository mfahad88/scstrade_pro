import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class mTextField extends StatelessWidget {
  final String? hintText;
  final String label;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final int? maxLength;
  const mTextField({super.key, this.hintText,required this.label, this.controller, this.inputFormatters, this.keyboardType, this.obscureText, this.maxLength});

  @override
  Widget build(BuildContext context) {
    return TextField(

      maxLength: maxLength,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          label: Text(label),
          floatingLabelBehavior: FloatingLabelBehavior.always
      ),
      inputFormatters: inputFormatters,
      obscureText: obscureText??false,
      keyboardType: keyboardType,
      buildCounter: (context, {required currentLength, required isFocused, required maxLength}) => null,
    );
  }
}
