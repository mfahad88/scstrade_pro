import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/models/indices/IndicesSummary.dart';
import 'package:scstrade_pro/theme/theme.dart';

class mIndicesCard extends StatelessWidget {
  final IndicesSummary indicesSummary;
  final BuildContext context;
  const mIndicesCard({super.key,required this.context,required this.indicesSummary,});

  @override
  Widget build(BuildContext _) {
    // var netChange=double.parse(indicesSummary.currentindex??'0.0') - double.parse(indicesSummary.preClose.toString());
    var percentageChange= (double.parse(indicesSummary.netchange??'0.0')/double.parse(indicesSummary.preClose.toString()))*100;
    var overallChange= (double.parse(indicesSummary.netchange??'0.0')/double.parse(indicesSummary.preClose.toString()))*100;
    return Container(

      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                indicesSummary.indexcode?.replaceAll('Index', '')??'No index found',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Utils.isDark(context)?Colors.white:Color(0xFF1C1C1C),
                  fontWeight: FontWeight.w600,
                  height: 1.33.r,
                  letterSpacing: 0.67,
                ),
              ),
              Row(
                children: [
                  Text(
                    Utils.commaSeparated(indicesSummary.currentindex),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Utils.isDark(context)?Colors.white:Color(0xFF1C1C1C),
                      fontWeight: FontWeight.w700,
                      height: 1.52.r,
                      letterSpacing: -0.44,
                    ),
                  ),
                 Container(
                   width: 15.r,
                   height: 15.r,

                   child: Image.asset(indicesSummary.netchange?.contains('-')??false?'images/drop_down.png':'images/drop_up.png',
                   color: indicesSummary.netchange?.contains('-')??false?Utils.isDark(context)?MaterialTheme.lightMediumContrastScheme().errorContainer:MaterialTheme.lightScheme().error:Utils.isDark(context)?MaterialTheme.lightScheme().secondaryFixedDim:MaterialTheme.lightScheme().primary,),
                 )

                ],
              ),
              Row(
                children: [
                  Container(
                    width: 8.r,
                    height: 6.55.r,
                    alignment: Alignment.bottomCenter,
                    child: Image.asset('images/drop_up.png',color: Utils.isDark(context)?MaterialTheme.lightScheme().secondaryFixedDim:MaterialTheme.lightScheme().primary,),
                  ),
                  Gap(2.r),
                  Text(
                    'H: (${indicesSummary.highindex})',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Utils.isDark(context)?MaterialTheme.lightScheme().secondaryFixedDim:MaterialTheme.lightScheme().primary,
                      fontWeight: FontWeight.w500,
                      height: 2.40.r,
                      letterSpacing: -0.20,
                    ),
                  )
                ],
              )
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    width: 82.27.r,
                    height: 16.98.r,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Color(0xFFEDFFE0),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.53,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF136E00),
                        ),
                        borderRadius: BorderRadius.circular(4.25),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '+4,411.27 (+4.03%)',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 7.96,
                          color: MaterialTheme.lightScheme().primary,
                          fontWeight: FontWeight.w500,
                          height: 1.60.r,
                          letterSpacing: -0.16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(6.r),
              Row(
                children: [
                  Container(
                    width: 82.27.r,
                    height: 16.98.r,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Utils.isDark(context)?Color(0xFF313030):Color(0xFFF4F0EE),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.53,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Utils.isDark(context)?Color(0xFF79776F):Color(0xFF79776F),
                        ),
                        borderRadius: BorderRadius.circular(4.25),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Volume: ${Utils.formatToMillions(double.parse(indicesSummary.volumetraded??'0.0'))}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 7.96.r,
                          color: Utils.isDark(context)?Colors.white:Color(0xFF1C1C1C),
                          fontWeight: FontWeight.w500,
                          height: 1.60.r,
                          letterSpacing: -0.16,
                        ),
                      ),
                    ),
                  ),
                  Gap(5.0),
                  Container(
                    width: 82.27.r,
                    height: 16.98.r,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Utils.isDark(context)?Color(0xFF313030):Color(0xFFF4F0EE),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.53,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Utils.isDark(context)?Color(0xFF79776F):Color(0xFF79776F),
                        ),
                        borderRadius: BorderRadius.circular(4.25),
                      ),
                    ),
                      child: Center(
                        child: Text(
                          'Value: ${Utils.formatToMillions(double.parse(indicesSummary.valuetraded??'0.0'))}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontSize: 7.96,
                            color: Utils.isDark(context)?Colors.white:Color(0xFF1C1C1C),
                            fontWeight: FontWeight.w500,
                            height: 1.60.r,
                            letterSpacing: -0.16,
                          ),
                        ),
                      )
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 8.r,
                    height: 6.55.r,
                    alignment: Alignment.bottomCenter,
                    child: Image.asset('images/drop_down.png',color: Utils.isDark(context)?MaterialTheme.lightMediumContrastScheme().errorContainer:MaterialTheme.lightScheme().error),
                  ),
                  Gap(2.r),
                  Text(
                    'L: (${indicesSummary.lowindex})',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Utils.isDark(context)?MaterialTheme.lightMediumContrastScheme().errorContainer:MaterialTheme.lightScheme().error,
                      fontWeight: FontWeight.w500,
                      height: 2.40.r,
                      letterSpacing: -0.20,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
