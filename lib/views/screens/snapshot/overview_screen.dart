import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/models/allData/Alldata_indices.dart';
import 'package:scstrade_pro/models/data/stock_card_data.dart';
import 'package:scstrade_pro/theme/theme.dart';
import 'package:scstrade_pro/viewmodels/alldata_viewmodel.dart';
import 'package:scstrade_pro/viewmodels/company_viewmodel.dart';
import 'package:scstrade_pro/views/widgets/line_chart_sample.dart';
import 'package:scstrade_pro/views/widgets/m_rounded_container.dart';

import '../../widgets/m_button.dart';

class OverviewScreen extends StatelessWidget {
  final BuildContext context;
  final StockCardData stockCardData;
  const OverviewScreen({super.key, required this.context,required this.stockCardData});

  @override
  Widget build(BuildContext _) {
    AlldataViewmodel viewmodel=context.watch();

    AlldataIndices? dataIndices=viewmodel.apiResponse.data?.where((element) => element.sym==stockCardData.symbol,).map((e) => e,).toList().first;
    return  Consumer<CompanyViewModel>(
      builder: (_,value, child) {
        return ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            mRoundedContainer(
              padding: EdgeInsets.symmetric(vertical: 14.r,horizontal: 10.r),
              color: Utils.isDark(context)?Color(0xFF1C1B1B):Color(0xFFFCF8F8),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child:  Container(
                          width: 38.05.r,
                          height: 38.05.r,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(dataIndices?.companyLogo??''),
                              fit: BoxFit.contain,
                            ),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(dataIndices?.nm??'',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Utils.isDark(context)?Colors.white:Color(0xFF1C1C1C),
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w600,
                                height: 1.33,
                                letterSpacing: -0.42,
                              ),
                            ),
                            Text(
                              dataIndices?.sn??'',
                              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                color: Utils.isDark(context)?Colors.white:Color(0xFF484646),
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w400,
                                height: 2,
                                letterSpacing: -0.14,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 9.r,vertical: 3.r),
                                  decoration: ShapeDecoration(
                                    color: Utils.isDark(context)?Colors.white:Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50.r)
                                    ),
                                  ),
                                  child: Text('REG',
                                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                      color: Utils.isDark(context)?Colors.black:Colors.white,
                                      fontWeight: FontWeight.w500,
                                      height: 1.60,
                                      letterSpacing: -0.17,
                                    ),),
                                ),
                                Gap(5.r),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 9.r,vertical: 3.r),
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF1A73E8),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50.r)
                                    ),
                                  ),
                                  child: Text(dataIndices?.ind!.split('|').first.replaceAll('Index', '')??'',
                                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      height: 1.60,
                                      letterSpacing: -0.17,
                                    ),),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '18.97',
                              textAlign: TextAlign.right,
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Utils.isDark(context)?MaterialTheme.lightScheme().primary:MaterialTheme.lightScheme().secondaryFixedDim,
                                fontWeight: FontWeight.w700,
                                height: 1.71,
                                letterSpacing: -0.42,
                              ),
                            ),
                            Text(
                              '0.62 (3.28%)',
                              textAlign: TextAlign.right,
                              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                color: Utils.isDark(context)?MaterialTheme.lightScheme().primary:MaterialTheme.lightScheme().secondaryFixedDim,
                                fontWeight: FontWeight.w500,
                                height: 1.88,
                                letterSpacing: -0.28,
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Avg Price: ',
                                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                      color: Utils.isDark(context)?Color(0xFFBCD0FF):Color(0xFF435E91),
                                      fontWeight: FontWeight.w500,
                                      height: 2.25,
                                      letterSpacing: -0.24,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '18.71',
                                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                      color: Utils.isDark(context)?Color(0xFFBCD0FF):Color(0xFF435E91),
                                      fontWeight: FontWeight.w700,
                                      height: 2.25,
                                      letterSpacing: -0.24,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.right,
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('images/drop_up.png',
                        width: 8.r,
                        height: 8.r,),
                      Gap(2.r),
                      Text(
                        'High: 17.85',
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Utils.isDark(context)?MaterialTheme.lightScheme().secondaryFixedDim:MaterialTheme.lightScheme().primary,
                          fontWeight: FontWeight.w500,
                          height: 2.25,
                          letterSpacing: -0.24,
                        ),
                      ),
                      Gap(4.r),
                      Image.asset('images/drop_down.png',
                        width: 8.r,
                        height: 8.r,
                        color: Utils.isDark(context)?MaterialTheme.lightScheme().errorContainer:MaterialTheme.lightScheme().error,),
                      Gap(2.r),
                      Text(
                        'Low: 12.60',
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Utils.isDark(context)?MaterialTheme.lightScheme().errorContainer:MaterialTheme.lightScheme().error,
                          fontWeight: FontWeight.w500,
                          height: 2.25,
                          letterSpacing: -0.24,
                        ),
                      ),

                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Utils.isDark(context)?Color(0xFF313030):Color(0xFFE5E2E1),
                  ),
                  Gap(10.r),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'MKT Cap',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Utils.isDark(context)?Colors.white:Color(0xFF1C1C1C),
                        fontWeight: FontWeight.w600,
                        height: 1.69,
                        letterSpacing: -0.31,
                      ),
                    ),
                  ),
                  GridView.count(
                    childAspectRatio: 8.0,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 0.0,
                    crossAxisSpacing: 0.0,
                    children: value.mktCap.entries.map((e) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(e.key,
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Utils.isDark(context)?Colors.white:Color(0xFF1C1C1C),
                            fontWeight: FontWeight.w500,
                            height: 2.25,
                            letterSpacing: -0.27,
                          ),
                        ),
                        Gap(3.r),
                        Text(e.value,
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color:Color(0xFFFF9500),
                            fontWeight: FontWeight.w500,
                            height: 2.25,
                            letterSpacing: -0.27,
                          ),
                        ),
                      ],
                    ),).toList(),
                  ),
                  Gap(4.r),
                  Divider(
                    thickness: 1.11.r,
                    color: Color(Utils.isDark(context)?0xFF5F5E5E:0xFF929090),
                  ),
                  Row(

                    children: [
                      _populateBuyerSellerPrice(isBuyer: true),
                      Gap(8.r),
                      _populateBuyerSellerPrice(isBuyer: false)
                    ],
                  ),


                ],
              ),

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
            Container(
              width: 400.r,
              height: 200.r,
              child: value.isLineSelected?LineChartSample(
                  gridData: FlGridData(
                      show: true
                  ),
                  titlesData: FlTitlesData(
                    show: false,
                  ),
                  spots: [
                    FlSpot(0, 1.5),
                    FlSpot(1, 2.5),
                    FlSpot(2, 4.5),
                    FlSpot(3, 3.5),
                    FlSpot(4, 3.5),
                    FlSpot(5, 3.5),
                    FlSpot(6, 0.5),
                    FlSpot(7, 2.5),

                  ]
              ):InteractiveChart(
                candles: value.candleData,
                initialVisibleCandleCount: 50,
                onCandleResize: (value) {
                  print(value);
                },
              ),
            ),
            Gap(4.r),
            Container(
              height: 30.r,
              padding: EdgeInsets.only(left: 10.r),
              decoration: ShapeDecoration(
                color:MaterialTheme.lightScheme().primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
              child: Text(
                'Company Snapshot',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  height: 1.99,
                  letterSpacing: -0.14,
                ),
              ),
            ),
            Gap(5.r),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.r),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: value.companySnapShot.entries.map((e) => Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          e.key,
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Utils.isDark(context)?Colors.white:Color(0xFF1C1C1C),
                            fontWeight: FontWeight.w400,
                            height: 2.32,
                            letterSpacing: -0.12,
                          ),
                        ),
                        Spacer(),
                        Text(
                          e.value,
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Utils.isDark(context)?Colors.white:Color(0xFF1C1C1C),
                            fontWeight: FontWeight.w400,
                            height: 2.32,
                            letterSpacing: -0.12,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: Color(0xFFE5E2E1),
                    )
                  ],
                ),).toList(),
              ),
            )
          ],
        );
      },

    );
  }
  _populateBuyerSellerPrice({required bool isBuyer}){
    return Row(
      children: [
        Container(
            constraints: BoxConstraints(
                maxWidth: 155.r
            ),
            padding: EdgeInsets.symmetric(vertical: 5.r,horizontal: 5.r),
            decoration: ShapeDecoration(
                color: Color(isBuyer?0xFFF7FAFF:0xFFFEF6FF),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.11.r, color: Color(isBuyer?0xFF435E91:0xFFA44FA9)),
                  borderRadius: BorderRadius.circular(11.14.r),
                )
            ),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isBuyer?'Buyer Price':'Seller Price',
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Utils.isDark(context)?Colors.white:Colors.black,
                            fontWeight: FontWeight.w400,
                            height: 0.99,
                            letterSpacing: -0.12,
                          ),
                        ),
                        Gap(15.r),
                        Text(
                          '38.86',
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            color:Utils.isDark(context)?Color(isBuyer?0xFFBCD0FF:0xFFA44FA9):isBuyer?MaterialTheme.specialHeadline.value:Color(0xFFA44FA9),
                            fontWeight: FontWeight.w700,
                            height: 0.34,
                            letterSpacing: -0.36,
                          ),
                        ),

                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 7.r),
                          width: 50.r,
                          height: 50.r,
                          child: LineChartSample(
                              color: Color(isBuyer?0xFF435E91:0xFFA44FA9),
                              spots: [
                                FlSpot(0, 0.0),
                                FlSpot(1, 1.5),
                                FlSpot(2, 2.5),
                                FlSpot(3, 3.5),
                                FlSpot(4, 5.5)
                              ]),
                        ),
                      ],
                    ),

                  ],
                ),
                Gap(8.r),
                Row(children: [
                  Container(
                    width: 135.r,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.11,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFE5E2E1),
                        ),
                      ),
                    ),
                  )
                ],),
                Gap(8.r),
                Row(

                  children: [
                    Text(
                      '15,000',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Color(isBuyer?0xFFFF9500:0xFFA44FA9),
                        fontWeight: FontWeight.w600,
                        height: 0.68,
                        letterSpacing: -0.18,
                      ),
                    )
                  ],
                ),
                Gap(8.r)
              ],
            )
        )
      ],
    );
  }
}
