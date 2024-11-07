import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String? data;
  final double? textSize;
  final TextStyle? myStyle;
  const MyText(this.data ,{super.key,this.textSize,this.myStyle});

  @override
  Widget build(BuildContext context) {
    return Text(data??"",
      style:getTextStyle(context)!.copyWith(
          color:myStyle?.color,
          backgroundColor:myStyle?.backgroundColor,
          fontSize:myStyle?.fontSize,
          fontWeight:myStyle?.fontWeight,
          fontStyle:myStyle?.fontStyle,
          height:myStyle?.height,
          decoration:myStyle?.decoration,
          decorationColor:myStyle?.decorationColor,
          decorationStyle:myStyle?.decorationStyle,
          decorationThickness:myStyle?.decorationThickness,
          fontFamily:myStyle?.fontFamily,
          overflow:myStyle?.overflow
      ),
    );
  }

  TextStyle? getTextStyle(BuildContext context){
    double width=MediaQuery.of(context).size.width;
    if(textSize == 10){
      return Theme.of(context).textTheme.labelSmall!.copyWith(
        fontSize: Theme.of(context).textTheme.labelSmall!.fontSize!/480*width
      );
    } else if(textSize == 12){
      return Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: Theme.of(context).textTheme.bodySmall!.fontSize!/480*width
      );
    }else if(textSize == 14){
      return Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize!/480*width
      );
    }else if(textSize==16){
        return Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize!/480*width
        );
    }else if(textSize==20){
      return Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: Theme.of(context).textTheme.titleLarge!.fontSize!/480*width
      );
    } else if(textSize==34){
        return Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize!/480*width
        );
      }
      return null;
  }
}
