import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget{
  final String title;
  const HeadingText(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(title,
        style: Theme.of(context).textTheme.headlineLarge
    );
  }


}