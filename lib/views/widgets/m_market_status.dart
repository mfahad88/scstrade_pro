import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/viewmodels/main_viewmodel.dart';

import '../../helper/Utils.dart';
import '../../theme/theme.dart';

class mMarketStatus extends StatefulWidget {
  const mMarketStatus({super.key});

  @override
  State<mMarketStatus> createState() => _mMarketStatusState();
}

class _mMarketStatusState extends State<mMarketStatus> {
  Timer? timer;
  String? currentTime=Utils.dateFormatter(dateTime: DateTime.now(), format: 'dd MMM yyyy | hh:mm a');
  @override
  void initState() {

    timer=Timer.periodic(Duration(seconds: 60), (timer) {
      setState(() {
        currentTime=Utils.dateFormatter(dateTime: DateTime.now(), format: 'dd MMM yyyy | hh:mm a');
      });
    },);
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // MainViewModel value=context.watch();
    return Row(
      children: [
        Text('Market Status:',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color:Utils.isDark(context)?Colors.white:const Color(0xFF1C1C1C),
              fontWeight: FontWeight.w500
          ),
        ),
        Container(
          constraints:  BoxConstraints(
              minWidth: 50.r,
              maxWidth: 70.r
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
                listTileTheme: const ListTileThemeData(
                    horizontalTitleGap: -5
                )
            ),
            child: RadioListTile(
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              fillColor: WidgetStatePropertyAll(
                  Utils.isDark(context)?const Color(0xFF2DE500):MaterialTheme.lightScheme().primary
              ),
              title: Text('OPEN',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color:  Utils.isDark(context)?const Color(0xFF2DE500):MaterialTheme.lightScheme().primary
                ),
              ),
              value: 'Open',
              groupValue: 'Open',
              onChanged: (value) => print(value),),
          ),
        ),
        Spacer(),
        Text(currentTime??'',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color:Utils.isDark(context)?Colors.white:const Color(0xFF1C1C1C),
                fontWeight: FontWeight.w500
            )
        ),

      ],
    );
  }

}
