import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  Widget? child;
  double? width;
  double? height;
  Color? surfaceTintColor;
  Color? shadowColor;
  MyCard({super.key,this.child,this.width,this.height,this.surfaceTintColor,this.shadowColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card.outlined(
        surfaceTintColor: surfaceTintColor,
        shadowColor: shadowColor,
        color: Colors.white,
        margin: EdgeInsets.zero,

        elevation: 5.0,
        /*shape: RoundedRectangleBorder(
            side: const BorderSide(
                color: Color(0xFFF5F5F5),
                width: 2,
                style: BorderStyle.solid
            ),
            borderRadius: BorderRadius.circular(10)
        ),*/
        child: child,
      ),
    );
  }
}
