import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/screens/watchlist/ui/widget/line_chartt.dart';
import 'package:scstrade_pro/widgets/chip.dart';
import 'package:scstrade_pro/widgets/my_text.dart';

import 'widget/RoundedContainer.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: ShapeDecoration(

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(width: 1,color: Color(0xFFE1E1E1))
            ),
            color: Utils.isDark(context)?Color(0xFF212121):Colors.white,
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
                // LineChartt()
              ],
            ),
          ),
        ),
        Gap(10),
        Container(
          decoration: ShapeDecoration(
            color: Utils.isDark(context)?Color(0xFF212121):Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFE1E1E1)),
                borderRadius: BorderRadius.circular(12),
              )
          ),
          child: Padding(
            padding:EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width:width*0.27,
                        child: RoundedContainer(text1: 'High', text2: '65,769.87')),
                    Gap(4),
                    SizedBox(
                      width: width*0.27,
                        child: RoundedContainer(text1: 'Bid', text2: '65,769.87')),
                    Gap(4),
                    SizedBox(
                        width: width*0.27,
                        child: RoundedContainer(text1: 'Vol', text2: '65,769.87'))
                  ],
                ),
                Gap(10),
                Row(
                  children: [
                    SizedBox(
                        width: width*0.27,
                        child: RoundedContainer(text1: 'Low', text2: '65,769.87')),
                    Gap(4),
                    SizedBox(
                        width: width*0.27,
                        child: RoundedContainer(text1: 'Ask', text2: '65,769.87')),
                    Gap(4),
                    SizedBox(
                        width: width*0.27,
                        child: RoundedContainer(text1: 'Vol', text2: '65,769.87'))
                  ],
                )
              ],
            )
          ),
        ),
        Gap(10),
        Container(
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFE1E1E1)),
                borderRadius: BorderRadius.circular(12),
              )
          ),
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    'Company Shots',
                    textSize: 16,
                    myStyle: TextStyle().copyWith(
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  Gap(12),
                  SizedBox(
                    height: height*0.72,
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        RoundedContainer(text1: 'Period', text2: 'Add Text or Value'),
                        Gap(4.0),
                        RoundedContainer(text1: 'Financial Year End', text2: 'Add Text or Value'),
                        Gap(4.0),
                        RoundedContainer(text1: 'Outstanding Shares', text2: 'Add Text or Value'),
                        Gap(4.0),
                        RoundedContainer(text1: 'Last Trade Price', text2: 'Add Text or Value'),
                        Gap(4.0),
                        RoundedContainer(text1: 'Change', text2: 'Add Text or Value'),
                        Gap(4.0),
                        RoundedContainer(text1: 'Financial Value', text2: 'Add Text or Value'),
                        Gap(4.0),
                        RoundedContainer(text1: '52 Week High', text2: 'Add Text or Value'),
                        Gap(4.0),
                        RoundedContainer(text1: '52 Week Low', text2: 'Add Text or Value'),
                        Gap(4.0),
                        RoundedContainer(text1: 'Last Trade Volume', text2: 'Add Text or Value'),
                        Gap(4.0),
                        RoundedContainer(text1: '52 Week Avg', text2: 'Add Text or Value'),
                        Gap(4.0),
                        RoundedContainer(text1: 'Total Volume', text2: 'Add Text or Value'),
                        Gap(4.0),
                        RoundedContainer(text1: '52 Week Average Volume', text2: 'Add Text or Value'),
                        Gap(4.0),
                        RoundedContainer(text1: '3M Avg Volume', text2: 'Add Text or Value'),
                        Gap(4.0),
                        RoundedContainer(text1: 'Free Float', text2: 'Add Text or Value'),
                      ],
                    ),
                  ),

                ],
              )
          ),
        ),
        Gap(10)
      ],
    );
  }
}
