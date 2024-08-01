import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  ValueChanged<String>? onChanged;
  TextInputType? keyboardType;
  GestureTapCallback? onTap;
  TextEditingController? controller;
  BuildContext context;
  bool readOnly;
  Textfield(this.context, {super.key,this.onChanged,this.keyboardType,this.onTap,this.controller, required bool this.readOnly});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly ,

      controller: controller,
      cursorColor:Theme.of(context).primaryColor ,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1
            )
        ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey, // Set the default border color
              width: 1.0,
            ),
          )
      ),
      style: Theme.of(context).textTheme.headlineMedium,
      keyboardType: keyboardType,
      onTap: onTap,
      onChanged: onChanged,
    );
  }
}
