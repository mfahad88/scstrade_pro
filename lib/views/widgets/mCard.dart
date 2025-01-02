import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/models/indices/Kse_indices.dart';
import 'package:scstrade_pro/theme/theme.dart';
import 'package:scstrade_pro/views/widgets/line_chart_sample.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class mCard extends StatelessWidget {
  final KseIndices kseIndices;
  final List<FlSpot> spots;
  const mCard({super.key, required this.kseIndices, required this.spots});

  @override
  Widget build(BuildContext context) {
    var changePercent=((double.parse(kseIndices.currentindex??'0.0')-double.parse(kseIndices.preClose.toString()))/double.parse(kseIndices.preClose.toString())*100);
    return Card.outlined(
      clipBehavior: Clip.none,
      elevation: 5.0,
      shape: OutlineInputBorder(
        borderSide: BorderSide(
          color: MaterialTheme.darkScheme().primary.withOpacity(0.15),
        ),
        borderRadius: BorderRadius.circular(10.0.r)
      ),
      color: Utils.isDark(context)?MaterialTheme.lightScheme().onPrimaryContainer:Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10.0.r),
        child: LayoutBuilder(
          builder: (context,constraints) {
            return Row(
              children: [
                Column(
                  children: [
                    Text(kseIndices.indexcode??'Index not found',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Row(
                      children: [
                        kseIndices.netchange!.contains('-')?Icon(Icons.arrow_drop_down,color: Color(0xFFD01B10),):Icon(Icons.arrow_drop_up,color: Utils.isDark(context)? MaterialTheme.darkScheme().secondary : MaterialTheme.lightScheme().primary,),

                        Text(Utils.formatToMillions(double.parse(kseIndices.valuetraded??'0.0')),
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                    Container(

                      decoration: BoxDecoration(
                        color: Utils.isDark(context)?kseIndices.netchange!.contains('-')?MaterialTheme.darkScheme().error.withOpacity(0.2):Colors.transparent:kseIndices.netchange!.contains('-')?MaterialTheme.lightScheme().error.withOpacity(0.2):MaterialTheme.lightScheme().primary.withOpacity(0.1),
                        border: Border.all(
                            width: 1,
                            color: Utils.isDark(context)?kseIndices.netchange!.contains('-')? Color(0xFFD01B10):Colors.white:kseIndices.netchange!.contains('-')?Color(0xFFD01B10):Color(0xFF3DA526)
                        ),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0.r,horizontal: 8.0.r),
                        child: Row(
                          children: [
                            kseIndices.netchange!.contains('-')?Icon(Icons.arrow_downward,color: Utils.isDark(context)?MaterialTheme.darkScheme().error:Color(0xFFD01B10),):Icon(Icons.arrow_upward,color: Utils.isDark(context)?MaterialTheme.darkScheme().secondary:MaterialTheme.lightScheme().primary,),
                            Text('${Utils.roundTwoDecimal(changePercent)}%',
                              style: Theme.of(context).textTheme.labelSmall,),
                            Gap(5.0.r),
                            Text(kseIndices.netchange!.contains('-')?'${kseIndices.netchange}':'+ ${kseIndices.netchange}',
                            style: Theme.of(context).textTheme.labelSmall,)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text('M.Vol: ${Utils.formatToMillions(double.parse(kseIndices.volumetraded??"0"))}',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 145.r,
                        maxHeight: 74.r,
                      ),
                      child: LineChartSample(spots: spots),
                    )
                  ],
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
