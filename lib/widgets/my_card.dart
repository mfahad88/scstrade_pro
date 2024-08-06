import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  Widget? child;
  double? width;
  double? height;
  MyCard({super.key,this.child,this.width,this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                color: Color(0xFFF5F5F5),
                width: 2,
                style: BorderStyle.solid
            ),
            borderRadius: BorderRadius.circular(10)
        ),
        child: child,
      ),
    );
  }
}
