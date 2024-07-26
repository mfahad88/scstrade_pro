import 'package:flutter/material.dart';

class SubHeadingText extends StatelessWidget {
  final String title;
  const SubHeadingText(this.title,{super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
