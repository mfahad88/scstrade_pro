import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scstrade_pro/screens/watchlist/ui/widget/line_chartt.dart';
import 'package:scstrade_pro/widgets/chip.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(width: 1,color: Color(0xFFE1E1E1))
              ),
              color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    Column(
                      children: [
                        FlutterLogo(size: 20,),

                      ],
                    ),
                    Gap(8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Unity',
                          style: Theme.of(context).textTheme.bodyLarge,),
                        Text('Unity Foods LTD',
                          style: Theme.of(context).textTheme.labelSmall,),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.arrow_drop_up,color: Color(0xFF2CE52F),size: 25,),
                    Text('86,466.57',style: Theme.of(context).textTheme.titleLarge,),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Volume: 365.941m',style: Theme.of(context).textTheme.bodyLarge,),
                    mChip(changeValue: '409.06', changePercent: '0.47%',)
                  ],
                ),
                LineChartt()
              ],
            ),
          ),
        )
      ],
    );
  }
}
