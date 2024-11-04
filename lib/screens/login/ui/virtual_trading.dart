import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/widgets/text_16.dart';

class VirtualTrading extends StatelessWidget {
  const VirtualTrading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Utils.isDark(context)?Color(0xFF737180):Color(0xFFC7C7CC)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/google_logo.png'),
                Gap(4),
                Text16(data: 'Google',style: TextStyle().copyWith(
                  color: Utils.isDark(context)? Colors.white:Color(0xFF222230),
                  fontSize: 16,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w600,
                  height: 0.08,
                ),)
              ],
            ),
          ),
        ),
        Gap(10),
        Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Utils.isDark(context)?Color(0xFF737180):Color(0xFFC7C7CC)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/facebook_logo.png'),
                Gap(4),
                Text16(data: 'Facebook',
                  style: TextStyle().copyWith(
                    color: Utils.isDark(context)? Colors.white:Color(0xFF222230),
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w600,
                    height: 0.08,
                  ),
                )
              ],
            ),
          ),
        ),
        Gap(MediaQuery.of(context).size.width*0.05),
        Divider(
            thickness: 1,
            color: Utils.isDark(context)?Color(0xFF737180):Color(0xFFC7C7CC)
        ),
        Gap(MediaQuery.of(context).size.width*0.05),
        Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Utils.isDark(context)?Color(0xFF737180):Color(0xFFC7C7CC)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email_outlined,color: Utils.isDark(context)? Colors.white:Color(0xFF222230),),
                Gap(4),
                Text16(data: 'Email',
                  style: TextStyle().copyWith(
                    color: Utils.isDark(context)? Colors.white:Color(0xFF222230),
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w600,
                    height: 0.08,
                  ),
                )
              ],
            ),
          ),
        ),
        Gap(10),
        Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Utils.isDark(context)?Color(0xFF737180):Color(0xFFC7C7CC)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone,color: Utils.isDark(context)? Colors.white:Color(0xFF222230),),
                Gap(4),
                Text16(data: 'Phone Number',
                  style: TextStyle().copyWith(
                    color: Utils.isDark(context)? Colors.white:Color(0xFF222230),
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w600,
                    height: 0.08,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
