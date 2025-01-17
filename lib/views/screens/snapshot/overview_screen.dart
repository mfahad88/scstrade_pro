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
import 'package:scstrade_pro/views/widgets/DashedLinePainter.dart';
import 'package:scstrade_pro/views/widgets/line_chart_sample.dart';
import 'package:scstrade_pro/views/widgets/m_barchart.dart';
import 'package:scstrade_pro/views/widgets/m_day_range.dart';
import 'package:scstrade_pro/views/widgets/m_rounded_container.dart';
import 'package:scstrade_pro/views/widgets/m_tab_bar.dart';

import '../../widgets/m_button.dart';

class OverviewScreen extends StatefulWidget  {
  final BuildContext context;
  final StockCardData stockCardData;

  const OverviewScreen({super.key, required this.context,required this.stockCardData});

  @override
  State<OverviewScreen> createState() => _OverviewScreen();
}
class _OverviewScreen extends State<OverviewScreen> with SingleTickerProviderStateMixin {

  late TabController _controller;
  @override
  void initState() {
    _controller=TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext _) {
    /*AlldataViewmodel viewmodel=context.watch();

    AlldataIndices? dataIndices=viewmodel.apiResponse.data?.where((element) => element.sym==stockCardData.symbol,).map((e) => e,).toList().first;*/
    return  Consumer<CompanyViewModel>(
      builder: (_,value, child) {
        return ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(bottom: kFloatingActionButtonMargin+50.r),
          children: [
            _overviewCard(value),
            Gap(10.r),
            _dayRangeCard(value),
            Gap(10.r),

            _performanceCard(value),
            Gap(10.r),
            _financialSummary(value),
            Gap(15.r),
            _earningImportantRatios(value),
            Gap(15.r),
            _expansionRatios(value),
          ],
        );
      },

    );
  }

  Widget _overviewCard(CompanyViewModel value) {

    return Container(
      width: double.infinity,
      height: 217.r,
      decoration: ShapeDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('images/image_overview_card.png')
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r)
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(left: 15.r,right: 15.r,top: 15.r),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  foregroundImage: AssetImage(value.companyOverview['company_logo']??''),
                  maxRadius: 20.r,
                ),
                Gap(10.r),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      value.companyOverview['name']??'',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 1.33,
                        letterSpacing: -0.43,
                      ),
                    ),
                    Text(
                      value.companyOverview['sn']??'',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                        letterSpacing: -0.14,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 36.77,
                          height: 18.37,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Color(0xFF9EEFFD),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(591.48),
                            ),
                          ),
                          child: Text(
                            'REG',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              height: 1.60,
                              letterSpacing: -0.17,
                            ),
                          ),
                        ),
                        Gap(5.r),
                        Container(
                          width: 51.67,
                          height: 18.37,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFF9500),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(591.48),
                            ),
                          ),
                          child: Text(
                            'KES100',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              height: 1.60,
                              letterSpacing: -0.17,
                            ),
                          ),
                        )

                      ],
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  width: 38.84.r,
                  height: 38.84.r,
                  child: Image.asset('images/share_icon.png',),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(),
                    shadows: [
                      BoxShadow(
                        color: Color(0x33000000),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Gap(14.r),
          Divider(
            thickness: 1.11.r,
            color:  Color(0xFFE5E2E1),
          ),
          Gap(24.r),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.r),
            child: Row(
              verticalDirection: VerticalDirection.down,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  'Rs.',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    height: 0.89,
                    letterSpacing: -2.56,
                  ),
                ),
                Gap(1.r),
                Text(
                  value.companyOverview['stockPrice']??'',
                  style:  Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 40.r,
                    fontWeight: FontWeight.w700,
                    height: 0.71,
                    letterSpacing: -2.40,
                  ),
                ),
                Gap(7.r),
                Text(
                  value.companyOverview['stockPricePercent']??'',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Color(0xFF2DE500),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    height: 1.31,
                    letterSpacing: -0.60,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.r),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Volume:',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        height: 2.25,
                        letterSpacing: -0.27,
                      ),
                    ),
                    Gap(6.r),
                    Text(
                      value.companyOverview['volume']??'',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Color(0xFFFFE100),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 2.25,
                        letterSpacing: -0.27,
                      ),
                    ),
                    Gap(6.r),
                    Text(
                      'Market Cap:',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        height: 2.25,
                        letterSpacing: -0.27,
                      ),
                    ),
                    Gap(6.r),
                    Text(
                      value.companyOverview['marketCap']??'',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Color(0xFFFFE100),
                        fontWeight: FontWeight.w700,
                        height: 2.25,
                        letterSpacing: -0.27,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Avg Volume (12M):',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        height: 2.25,
                        letterSpacing: -0.27,
                      ),
                    ),
                    Gap(6.r),
                    Text(
                      value.companyOverview['avgVolume']??'',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Color(0xFFFFE100),
                        fontWeight: FontWeight.w700,
                        height: 2.25,
                        letterSpacing: -0.27,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _dayRangeCard(CompanyViewModel value) {
    return mRoundedContainer(
        color: Color(0xFFFCF8F8),
        side: BorderSide(width: 1, color: Color(0xFFE5E2E1)),
        borderRadius: BorderRadius.circular(12),
        child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [

                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 10.r,left: 10.r),
                    child: Text(
                      value.days[index],
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Color(Utils.isDark(context)?0xFFFFFFFF:0xFF1C1C1C),
                        fontWeight: FontWeight.w500,
                        height: 1.69,
                        letterSpacing: -0.64,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Gap(10.r),
                        Text(
                          'Rs. 218.76',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Color(Utils.isDark(context)?0xFFFFFFFF:0xFF1C1C1C),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.72,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Rs. 233.29',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Color(Utils.isDark(context)?0xFFFFFFFF:0xFF1C1C1C),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.72,
                          ),
                        ),
                        Gap(10.r)
                      ],
                    ),
                  ),
                  Container(
                      child: mDayRange(minValue: 193.76, maxValue: 233.29, currentValue: 230.01))
                ],
              );
            },
            separatorBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(1.0),
              child: CustomPaint(
                painter: DashedLinePainter(),
              ),
            ),
            itemCount: 4)
    );

  }

  _performanceCard(CompanyViewModel value) {
    return mRoundedContainer( child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Performance',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Utils.isDark(context)?Colors.white:Color(0xFF1C1C1C),
            fontWeight: FontWeight.w700,
            height: 1.35,
            letterSpacing: -0.40,
          ),
        ),
        Gap(8.r),
        Container(
            width: 400.r,
            height: 220.r,
            child: mBarChart(
              context: context,
                performance: value.performance,
                maxY: 100.0,
                reservedLeftSize:40,
              reservedBottomSize: 22,
              gridData: FlGridData(show: true,drawVerticalLine: false,horizontalInterval: 10.0,),

            )
        )
      ],
    ),
      color: Color(0xFFFCF8F8),
      width: 400.r,
      height: 275.r,
      side: BorderSide(width: 1, color: Color(0xFFE5E2E1)),
      borderRadius: BorderRadius.circular(12),
      padding: EdgeInsets.symmetric(vertical: 10.r,horizontal: 15.r),);



  }

  _financialSummary(CompanyViewModel value) {
    return mRoundedContainer(
        width: 400.r,
        color:  Color(0xFFFCF8F8),
        side: BorderSide(width: 1, color: Color(0xFFE5E2E1)),
        padding: EdgeInsets.symmetric(horizontal: 15.r,vertical: 10.r),
        borderRadius: BorderRadius.circular(12),
        child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Text(value.financialSummary.keys.toList()[index],
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Color(0xFF1C1C1C),
                      fontWeight: FontWeight.w500,
                      height: 1.88,
                      letterSpacing: -0.32,
                    ),
                  ),
                  Spacer(),
                  Text(value.financialSummary.values.toList()[index],
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Color(0xFF136E00),
                      fontWeight: FontWeight.w700,
                      height: 1.88,
                      letterSpacing: -0.32,
                    ),),
                ],
              );
            },
            separatorBuilder: (context, index) => Divider(
              thickness: 1.11.r,
              color: Color(0xFFE5E2E1),
            ),
            itemCount: value.financialSummary.length)
    );
  }

  _earningImportantRatios(CompanyViewModel value) {

    return mRoundedContainer(
      color: Color(0xFFFCF8F8),
      padding: EdgeInsets.only(left: 5.r,right: 5.r,top: 5.r),
      borderRadius: BorderRadius.circular(12.r),
      child: Column(
        children: [
         mTabbar(
           controller: _controller,
           tabs: ['Earnings','Important Ratios'],
           onTap: (v) => value.selectedRatio=v,
         ),
          ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  textBaseline: TextBaseline.alphabetic,
                  verticalDirection: VerticalDirection.down,
                  children: [
                    Text(value.selectedRatio==0?value.earnings.keys.toList()[index]:value.impRatios.keys.toList()[index],
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Color(0xFF1C1C1C),
                        fontWeight: FontWeight.w500,
                        height: 1.88,
                        letterSpacing: -0.32,
                      ),
                    ),
                    Gap(3.r),
                    Text(value.selectedRatio==0?value.earnings.values.toList()[index].keys.first:value.impRatios.values.toList()[index].keys.first,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Color(0xFFb2afaf),
                        fontWeight: FontWeight.w500,
                        height: 1.0,
                        letterSpacing: -0.32,
                      ),
                    ),
                    Spacer(),
                    Text(value.selectedRatio==0?value.earnings.values.toList()[index].values.first:value.impRatios.values.toList()[index].values.first,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Color(0xFF136E00),
                        fontWeight: FontWeight.w700,
                        height: 1.88,
                        letterSpacing: -0.32,
                      ),),
                  ],
                );
              },
              separatorBuilder: (context, index) => Divider(
                thickness: 1.11.r,
                color: Color(0xFFE5E2E1),
              ),
              itemCount: value.selectedRatio==0?value.earnings.length:value.impRatios.length
          ),
          Gap(20.r),
          Container(
            width: 320.r,
            height: 160.r,
            child: mBarChart(
              context: context,
                performance: value.eps,
                maxY: 75,
                reservedLeftSize: 15.0,
                reservedBottomSize: 40.0,
                gridData: FlGridData(show: false),
            ),
          ),
          Gap(20.r),
          Container(
            width: 320.r,
            height: 160.r,
            child: mBarChart(
              context: context,
              performance: value.quaterlyEps,
              maxY: 20,
              reservedLeftSize: 15.0,
              reservedBottomSize: 40.0,
              gridData: FlGridData(show: false),
            ),
          ),
        ],
      ),

    );
  }

  _expansionRatios(CompanyViewModel value) {
    return ExpansionTile(
      shape: Border(),
      childrenPadding: EdgeInsets.symmetric(horizontal: 15.r),
      iconColor: Colors.black,
      trailing: value.isEquityRatioExpanded?Icon(Icons.arrow_drop_down):Icon(Icons.arrow_right),

      collapsedShape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Color(0xFFE5E2E1)),
        borderRadius: BorderRadius.circular(6),
      ),
      initiallyExpanded: value.isEquityRatioExpanded,
        onExpansionChanged: (v) {
          value.isEquityRatioExpanded=v;
        },
        title: Text(value.equityRatios.keys.first,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Color(0xFF1C1C1C),
            fontWeight: FontWeight.w600,
            height: 1.67,
            letterSpacing: -0.36,
          ),
        ),
      children: [
        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                textBaseline: TextBaseline.alphabetic,
                verticalDirection: VerticalDirection.down,
                children: [
                  Text(value.equityRatios.values.first[index].key??"",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Color(0xFF1C1C1C),
                      fontWeight: FontWeight.w500,
                      height: 1.88,
                      letterSpacing: -0.32,
                    ),
                  ),
                  Gap(3.r),
                  Text(value.equityRatios.values.first[index].desc??"",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Color(0xFFb2afaf),
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                      letterSpacing: -0.32,
                    ),
                  ),
                  Spacer(),
                  Text(value.equityRatios.values.first[index].value??"",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Color(0xFF136E00),
                      fontWeight: FontWeight.w700,
                      height: 1.88,
                      letterSpacing: -0.32,
                    ),),
                ],
              );
            },
            separatorBuilder: (context, index) => Divider(
              thickness: 1.11.r,
              color: Color(0xFFE5E2E1),
            ),
            itemCount: value.equityRatios.values.first.length
        ),
        Gap(5.r),
        Container(
        width: 400.r,
        height: 200.r,
          child: Stack(
            children: [
              mBarChart(
                  performance: value.priceToBook,
                  maxY: 600,
                  reservedLeftSize: 20,
                  reservedBottomSize: 30,
                  gridData: FlGridData(
                    show: false
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false)
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Text('${value.toInt()}',
                            style: TextStyle(
                              color: Color(0xFF5F5E5E),
                              fontSize: 10.r,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 2.70,
                              letterSpacing: -0.30,
                            )
                        );
                      },
                    )
                  ),
                  context: context),
              LineChart(
                  LineChartData(
                      maxY: 600,
                      minY: 0,
                      minX: 0,
                      maxX: 4.2,
                      gridData: FlGridData(
                        show: false,

                      ),
                      borderData: FlBorderData(
                          show: false
                      ),
                      titlesData: FlTitlesData(
                          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false,reservedSize: 20)),
                          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                            reservedSize: 20,
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              print(value/1000);
                              return Text('${value/1000}',style: TextStyle(
                                  fontSize: 5
                              ),);
                            },
                          )
                          )
                      ),

                      lineBarsData: [
                        LineChartBarData(

                            isCurved: true,
                            color: Colors.black,
                            spots: [
                              FlSpot(0, 600),
                              FlSpot(1, 100),
                              FlSpot(2, 200),
                              FlSpot(3, 300),
                              FlSpot(4, 400),
                            ]
                        )
                      ]
                  )
              )
            ],
          ),
        ),
        Gap(5.r),
        Container(
          width: 400.r,
          height: 230.r,
          child: LineChart(
            LineChartData(
              maxY: 25,
              maxX: 5,
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false)
                ),
                rightTitles:  AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                )
              ),
              gridData: FlGridData(
                show: false
              ),
              lineBarsData:value.priceToBookPercent
            )
          ),
        )
      ],

    );
  }



}
