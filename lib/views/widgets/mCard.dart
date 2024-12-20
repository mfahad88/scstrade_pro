import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/models/indices/Kse_indices.dart';
import 'package:scstrade_pro/theme/theme.dart';
import 'package:scstrade_pro/views/widgets/line_chart_sample.dart';

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
        borderRadius: BorderRadius.circular(10.0)
      ),
      color: Utils.isDark(context)?MaterialTheme.lightScheme().onPrimaryContainer:Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
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
                        kseIndices.valuetraded!.contains('-')?Icon(Icons.arrow_drop_down,color: Utils.isDark(context)? MaterialTheme.darkScheme().error : Color(0xFF6E0000FF),):Icon(Icons.arrow_drop_up,color: Utils.isDark(context)? MaterialTheme.darkScheme().secondary : MaterialTheme.lightScheme().primary,),

                        Text(Utils.formatToMillions(double.parse(kseIndices.valuetraded??'0.0')),
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Utils.isDark(context)?Colors.transparent:MaterialTheme.lightScheme().primary.withOpacity(0.1),
                        border: Border.all(
                            width: 1,
                            color: Utils.isDark(context)?Colors.white:Color(0xFF3DA526)
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 8.0),
                        child: Row(
                          children: [
                            kseIndices.netchange!.contains('-')?Icon(Icons.arrow_downward,color: Utils.isDark(context)?MaterialTheme.darkScheme().error:Color(0xFF6E0000FF),):Icon(Icons.arrow_upward,color: Utils.isDark(context)?MaterialTheme.darkScheme().secondary:MaterialTheme.lightScheme().primary,),
                            Text('${Utils.roundTwoDecimal(changePercent)}%',
                              style: Theme.of(context).textTheme.labelSmall,),
                            Gap(5.0),
                            Text(kseIndices.netchange!.contains('-')?'-':'+'+'${kseIndices.netchange}',
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
                        maxWidth: constraints.maxWidth*0.4,
                        maxHeight: constraints.maxHeight*0.5,
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
