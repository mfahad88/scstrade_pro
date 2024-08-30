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
        items: items.map((e) {
          return DropdownMenuItem(
              value:e,
              child: Text(e)
          );
        }).toList(),
        onChanged: onChanged);


    /*DropdownMenu(
          width: 170,
        textStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700
        ),

        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0)
          )
        ),
        dropdownMenuEntries: items.map((e) {
          return DropdownMenuEntry(value: e, label: e);
        },).toList(),
      onSelected: onSelected,

    );*/
  }
}
