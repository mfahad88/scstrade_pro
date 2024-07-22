import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final IconData iconData;
  final bool rtl;

  const MyButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.rtl = false,
    required this.iconData
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor, 
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
      onPressed: onPressed,
      child: this.rtl?Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData,size: 24),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 16.0),
            ),
          ),

        ]
      ): Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Icon(iconData,size: 24,)
          ],
        )
    );
  }
}
