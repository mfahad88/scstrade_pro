import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/viewmodels/main_viewmodel.dart';
import 'package:scstrade_pro/views/widgets/m_rounded_container.dart';

import '../../theme/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Consumer<MainViewModel>(
        builder: (context,value,child) {
          return Column(
            children: [
              mRoundedContainer(
                color: Utils.isDark(context)?const Color(0xFF011500):MaterialTheme.lightScheme().surfaceTint.withOpacity(0.05),
                child: _indicesCard(
                    context: context,
                    value: value,
                    size: size
                ),
              )
            ],
          );
        }
    );
  }

  Widget _indicesCard({required BuildContext context,required Size size,required MainViewModel value}){
    return Column(
      children: [
        Row(
          children: [
            Text('Market Status:',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color:Utils.isDark(context)?Colors.white:const Color(0xFF1C1C1C),
                  fontWeight: FontWeight.w500
              ),
            ),
            Container(
              constraints: const BoxConstraints(
                  minWidth: 50,
                  maxWidth: 70
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
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color:  Utils.isDark(context)?const Color(0xFF2DE500):MaterialTheme.lightScheme().primary
                    ),
                  ),
                  value: 'Open',
                  groupValue: 'Open',
                  onChanged: (value) => print(value),),
              ),
            ),
            Spacer(),
            Text(value.currentTime??'',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color:Utils.isDark(context)?Colors.white:const Color(0xFF1C1C1C),
                    fontWeight: FontWeight.w500
                )
            ),

          ],
        ),
        Divider(
          color: Color(0xFFE5E2E1),
          thickness: 1,
          height: 1,
        ),
        Gap(Utils.percentToPx(percent: 1, size: size,isWidth: false)),
        Row(
          children: [
            Container(
              width: 23,
              height: 23,

              child: RotatedBox(
                  quarterTurns: 1,
                  child: Icon(Icons.arrow_forward_ios_sharp,
                    size: 14.0,)
              ),
              decoration: ShapeDecoration(
                  color: MaterialTheme.specialHeadline.value,
                  shape: CircleBorder(
                      side: BorderSide(
                          color: MaterialTheme.specialHeadline.value
                      )
                  )
              ),
            ),
            Gap(Utils.percentToPx(percent: 2 , size: size)),
            Text('KMIALLSHR',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w700
              ),
            ),
            Spacer(),
            Container(
              width: Utils.percentToPx(percent: 42, size: size),
              child: mRoundedContainer(
                  color: Color(0xFFF4F0EE),
                  side: BorderSide(
                    color:  Color(0xFF79776F),
                    width: 0.78
                  ),
                  child: Row(
                    children: [
                      Text('Volume:'),
                      Text('424.810m'),
                    ],
                  )
              ),
            )
          ],
        ),
        Gap(Utils.percentToPx(percent: 1, size: size,isWidth: false)),
        Row(
          children: [
            Text('113,924.41',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w700
              ),
            ),
            Icon(Icons.arrow_drop_up),
            Spacer(),
            Container(
              width: Utils.percentToPx(percent: 42, size: size),
              child: mRoundedContainer(
                  color: Color(0xFFF4F0EE),
                  side: BorderSide(
                      color:  Color(0xFF79776F),
                      width: 0.78
                  ),
                  child: Row(
                    children: [
                      Text('+4,411.27'),
                      Gap(2.0),
                      Text('(+4.03%)'),
                    ],
                  )
              ),
            )
          ],
        ),
        Gap(Utils.percentToPx(percent: 2, size: size,isWidth: false)),
        Divider(
          color: Color(0xFFE5E2E1),
          thickness: 1,
          height: 1,
        ),
        Row(
          children: [
            Icon(Icons.arrow_drop_up),
            Text('High:'),
            Text(' 110,891.35'),
            Gap(2),
            Text('1378.22(1.24%)'),
            Spacer(),
            Icon(Icons.arrow_drop_down),
            Text('Low:'),
            Text(' 110,891.35'),
            Gap(2),
            Text('1378.22(1.24%)'),
          ],
        )
      ],
    );
  }
}
