import 'package:flutter/material.dart';

class ButtonHighlight extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onPressed;
  const ButtonHighlight({super.key,required this.title,required this.isSelected,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            foregroundColor: isSelected?Colors.white:Colors.black,
            backgroundColor: isSelected? Colors.greenAccent.shade700:Colors.white,
            textStyle: const TextStyle(
                fontSize: 8,
              fontWeight: FontWeight.w700
            )
        ),
        child: Text('$title'),
      ),
    );
  }
}
