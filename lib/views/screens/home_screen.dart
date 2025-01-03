import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/models/data/stock_card_data.dart';
import 'package:scstrade_pro/models/response/api_response.dart';
import 'package:scstrade_pro/viewmodels/alldata_viewmodel.dart';
import 'package:scstrade_pro/viewmodels/main_viewmodel.dart';
import 'package:scstrade_pro/views/widgets/m_button.dart';
import 'package:scstrade_pro/views/widgets/m_rounded_container.dart';
import 'package:scstrade_pro/views/widgets/m_segmented_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scstrade_pro/views/widgets/m_stock_card.dart';

import '../../theme/theme.dart';

class HomeScreen extends StatelessWidget {
  final BuildContext ctx;
  const HomeScreen({super.key,required this.ctx});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainViewModel>(
        builder: (_,value,child) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 15.r),
            child: Consumer<AlldataViewmodel>(
              builder: (BuildContext _, AlldataViewmodel allData, Widget? child) {
                return ListView(
                  children: [
                    mRoundedContainer(
                      color: Utils.isDark(context)?const Color(0xFF011500):MaterialTheme.lightScheme().surfaceTint.withOpacity(0.05),
                      padding: EdgeInsets.symmetric(horizontal: 10.r,vertical: 4.r),
                      child: _indicesCard(
                        context: ctx,
                        value: value,
                      ),
                    ),
                    Gap(10.r),
                    Text(
                      'Leaders:',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Color(0xFF1C1C1C),
                        fontWeight: FontWeight.w700,
                        height: 1.33,
                        letterSpacing: -0.54,
                      ),
                    ),
                    Gap(5.r),
                    _leaderList(allData)

                  ],
                );
              },
            ),
          );
        }
    );
  }

  Widget _indicesCard({required BuildContext context,required MainViewModel value}){
    print(Theme.of(context).textTheme.labelSmall!.fontSize);
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
        Gap(10.r),
        Row(
          children: [
            Container(
              width: 23.r,
              height: 23.r,

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
            Gap(7.r),
            Text('KMIALLSHR',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w700,
                letterSpacing: -0.44,
              ),
            ),
            Spacer(),
            Container(
              width: 121.r,
              child: mRoundedContainer(
                  padding: EdgeInsets.symmetric(horizontal: 5.r,vertical: 4.r),
                  color: Color(0xFFF4F0EE),
                  side: BorderSide(
                      color:  Color(0xFF79776F),
                      width: 0.78
                  ),
                  child: Row(
                    children: [
                      Text('Volume: ',
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.23
                        ),
                      ),
                      Text('424.810m',
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.23
                        ),
                      ),
                    ],
                  )
              ),
            )
          ],
        ),
        Gap(2.r),
        Row(
          children: [
            Text('113,924.41',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                letterSpacing: -0.64
              ),
            ),
            Image.asset('images/drop_up.png',width: 20.r,),
            Gap(10.r),
            Container(
              width:  121.r,
              child: mRoundedContainer(
                  padding: EdgeInsets.symmetric(horizontal: 5.r,vertical: 4.r),
                  color: Color(0xFFF4F0EE),
                  side: BorderSide(
                      color:  Color(0xFF79776F),
                      width: 0.78
                  ),
                  child: Row(
                    children: [
                      Text('+4,411.27',
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.23

                        ),
                      ),
                      Gap(2.0.r),
                      Text('(+4.03%)',
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.23
                        ),
                      ),
                    ],
                  )
              ),
            )
          ],
        ),
        Gap(10.r),
        Divider(
          color: Color(0xFFE5E2E1),
          thickness: 1,
          height: 1,
        ),
        Gap(2.r),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('images/drop_up.png',width: 8.r,),
            Gap(2.r),
            Text('High:',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    letterSpacing: -0.20
                )
            ),
            Text(' 110,891.35',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  letterSpacing: -0.20
              ),),
            Gap(2.r),
            Text('1378.22(1.24%)',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    letterSpacing: -0.20
                )),
            Spacer(),
            Image.asset('images/drop_down.png',width: 8.r,),
            Gap(2.r),
            Text('Low:',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    letterSpacing: -0.20
                )),
            Text(' 110,891.35',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    letterSpacing: -0.20
                )),
            Gap(2.r),
            Text('1378.22(1.24%)',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    letterSpacing: -0.20
                )),
          ],
        ),
        SingleChildScrollView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          child: Row(

            children: [
              mButton(
                ctx: context,
                selected: value.isLineSelected,
                title: 'Line', onPressed: (v) {
                if(!value.isLineSelected) {
                  value.toggleChart(v);
                }
              },
              ),
              // Gap(3.r),
              mButton(
                ctx: context,
                selected: value.isCandleSelected,
                title: 'Candle', onPressed: (v) {
                if(!value.isCandleSelected){
                  value.toggleChart(v);
                }
              },
              ),
              // Gap(3.r),
             Row(
               children: value.mins.asMap().entries.map((e) {

                 return Row(
                   children: [
                     mButton(ctx: context,selected: value.mins[e.key]==value.selectedMins, title: e.value, onPressed: (v) => value.toggleMins(v) ,),
                     // Gap(3.r)
                   ],
                 );
               },).toList(),
             )

            ],
          ),
        ),

      ],
    );
  }

  Widget _leaderList(AlldataViewmodel allData) {
    switch (allData.apiResponse.status){

      case null:
        // TODO: Handle this case.
      case Status.loading:
        return Center(child: CircularProgressIndicator(),);
      case Status.completed:

        return ListView.separated(
          shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => mStockCard(stockCardData: allData.fetchLeaders().map((e) =>
                StockCardData(e.companyLogo, e.ind, e.sym, e.nm, e.v.toString(), e.cl.toString(), e.ch.toString(),
                    e.chp.toString(), e.hp.toString(), e.lp.toString(), e.ap.toString(), e.av.toString(), e.bp.toString(), e.bv.toString(), [
                      FlSpot(0, 1.5),
                      FlSpot(1, 2.5),
                      FlSpot(2, 4.5),
                      FlSpot(3, 3.5),
                      FlSpot(4, 3.5),
                    ]),).toList()[index]),
            separatorBuilder: (context, index) => Gap(5.r),
            itemCount:  10);
      case Status.error:
        return Text(allData.apiResponse.message??'');
    }
  }
}
