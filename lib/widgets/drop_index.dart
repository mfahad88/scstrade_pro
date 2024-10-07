import 'package:flutter/material.dart';

class DropIndex extends StatelessWidget {
  final List<dynamic> items;
  final ValueChanged onChanged;
  final String value;
  const DropIndex({super.key,required this.value,required this.items,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: value,
        enableFeedback: true,
        padding: EdgeInsets.zero,
        items: items.map((e) {
          return DropdownMenuItem(
              value:e,
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Text(e,
                    style: const TextStyle(
                        fontSize: 10
                    ),
                  )
              )
          );
        }).toList(),
        onChanged: onChanged);

  }
}
