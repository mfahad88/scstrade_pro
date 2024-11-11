import 'package:flutter/material.dart';

class DropIndex extends StatelessWidget {
  final List<dynamic> items;
  final ValueChanged onChanged;
  final String value;
  final TextStyle? style;
  const DropIndex({super.key,required this.value,required this.items,required this.onChanged,this.style});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: value,
        enableFeedback: true,
        style: style,
        padding: EdgeInsets.zero,
        items: items.map((e) {
          return DropdownMenuItem(
              value:e,
              child: Text(e,
                style: style,
              )
          );
        }).toList(),
        onChanged: onChanged);

  }
}
