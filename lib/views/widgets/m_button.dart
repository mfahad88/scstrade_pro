import 'package:flutter/material.dart';
import 'package:scstrade_pro/theme/theme.dart';

class mButton extends StatelessWidget {
  final bool selected;
  final String title;
  final VoidCallback? onPressed;
  const mButton({super.key, required this.selected, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: onPressed,
        style: ButtonStyle(

        ),
        child: Text(title,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
          letterSpacing: 0.06,
          color: selected?Colors.white:MaterialTheme.lightScheme().onSurfaceVariant
        ),)
    );
  }
}
