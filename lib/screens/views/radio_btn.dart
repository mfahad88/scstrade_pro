import 'package:flutter/material.dart';

class RadioBtn extends StatelessWidget {
  String title;
  String? groupValue;
  Function (String) onChanged;
  RadioBtn({required this.title,this.groupValue,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Radio<String>(
        value: title,
        groupValue: groupValue,
        onChanged: (value) {
          onChanged(value!);
        },
      ),
    );
  }
}
