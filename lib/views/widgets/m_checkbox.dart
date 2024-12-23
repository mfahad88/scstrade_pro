import 'package:flutter/material.dart';
import 'package:scstrade_pro/theme/theme.dart';

class mCheckbox extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool?>? onChanged;
  const mCheckbox({super.key, required this.title, required this.onChanged, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0.0,
      child: CheckboxListTile(
        checkColor: Colors.white,
        fillColor: WidgetStateProperty.resolveWith((states) {
          if(states.contains(WidgetState.selected)){
            return MaterialTheme.lightScheme().primary;
          }
        },),
        title: Text(title,style: Theme.of(context).textTheme.bodyLarge,),
          controlAffinity: ListTileControlAffinity.leading,
          value: value,
          onChanged: onChanged),
    );
  }
}
