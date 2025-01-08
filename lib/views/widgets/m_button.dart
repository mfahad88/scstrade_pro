import 'package:flutter/material.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class mButton extends StatelessWidget {
  final bool selected;
  final String title;
  final Function(String v) onPressed;
  final BuildContext ctx;
  const mButton({super.key, required this.selected, required this.title, required this.onPressed, required this.ctx});

  @override
  Widget build(BuildContext context) {
    return selected?FilledButton(
        onPressed: () => onPressed(title),
        style: FilledButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.symmetric(horizontal: 9.r,vertical: 4.r),
          // fixedSize: Size(41.r, 21.r),
          backgroundColor: const Color(0xFF1C1C1C),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)
            )
        ),
        child: Text(title,
          style: Theme.of(ctx).textTheme.labelSmall!.copyWith(
            letterSpacing: 0.06,
            color: Colors.white,
          ),
        )
    ):OutlinedButton(
        onPressed: () => onPressed(title),
        style: OutlinedButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.symmetric(horizontal: 9.r,vertical: 4.r),
          // fixedSize: Size(41.r, 21.r),
        backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          side: BorderSide(
            color: MaterialTheme.lightScheme().outlineVariant,
            width: 1,
          ),

        ),
        child:  Text(title,
          style: Theme.of(ctx).textTheme.labelSmall!.copyWith(
            letterSpacing: 0.06,
            color: Utils.isDark(context)?Colors.white:MaterialTheme.lightScheme().onSurfaceVariant
          ),
        )
    );
  }
}
