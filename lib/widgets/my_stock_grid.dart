import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/models/MyStock.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';

class MyStockGrid extends StatelessWidget {
  final List<MyStock>? list;
  const MyStockGrid({super.key,this.list});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=context.read();
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding:  EdgeInsets.zero,
      clipBehavior: Clip.none,
      itemCount: list?.length,
      itemBuilder: (context, index) {
        return Card.filled(

          // surfaceTintColor:list![index].profitLoss.contains("+")?const Color(0x1A12D18E) : const Color(0x1AF75555),
            shadowColor:  Colors.grey.shade500/*list![index].profitLoss.contains("+")?const Color(0xFF12D18E) : const Color(0xFFF75555)*/,
            elevation: 5.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                    colors: [
                      list![index].profitLoss.contains("+")?const Color(0x1F12D18E) : const Color(0x1FF75555),
                      list![index].profitLoss.contains("+")?const Color(0x1A12D18E) : const Color(0x1AF75555),
                      list![index].profitLoss.contains("+")?const Color(0x1212D18E) : const Color(0x12F75555)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [
                      0.3,
                      0.7,
                      1.0,
                    ]
                ),

              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                        radius: 20,
                        child: Image.asset(list![index].image,fit: BoxFit.fill,)),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width:100,
                                child: Text(list![index].title,
                                    overflow: TextOverflow.ellipsis,maxLines: 1,
                                    style: themeController.themeData.textTheme.bodyLarge)
                            ),
                            Text(list![index].shortName)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      constraints: const BoxConstraints(
                          minWidth: 72,
                          maxWidth: 72,
                          minHeight: 32,
                          maxHeight: 32
                      ),
                      child: LineChart(
                        LineChartData(
                          minX: 0,
                          minY: 0,
                          maxX: 5,
                          maxY: 5,
                          gridData: const FlGridData(show: false),
                          titlesData: const FlTitlesData(show: false),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: list![index].spots,
                              isCurved: false,
                              color: list![index].profitLoss.contains("+")?const Color(0xFF12D18E) : const Color(0xFFF75555),
                              barWidth: 2,
                              isStrokeCapRound: true,
                              dotData: const FlDotData(show: false),
                              belowBarData: BarAreaData(
                                  show: false,
                                  color: list![index].profitLoss.contains("+")?const Color(0x1A12D18E) : const Color(0x1AF75555)
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(list![index].totalAmount,style: themeController.themeData.textTheme.bodyLarge!.copyWith(
                                    fontSize: 18
                                ),),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(list![index].profitLoss,style: themeController.themeData.textTheme.bodySmall!.copyWith(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: list![index].profitLoss.contains("+")?const Color(0xFF12D18E) : const Color(0xFFF75555)
                                )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            )
        );
      },
    );
  }
}
