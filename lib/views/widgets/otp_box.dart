import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpBox extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  const OtpBox({super.key,this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 1,
      textAlign: TextAlign.center,
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(
        signed: false,
        decimal: false
      ),
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
        hintText: '0'
      ),
      buildCounter: (context, {required currentLength, required isFocused, required maxLength}) => null,
      onChanged: onChanged,

    );
  }
}
