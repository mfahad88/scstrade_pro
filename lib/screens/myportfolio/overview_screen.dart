import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';

import '../../helper/Utils.dart';
import '../../widgets/row_key_value.dart';

class OverviewScreen extends StatelessWidget {
  final String? title;
  const OverviewScreen({super.key,this.title});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=context.read();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
                    child: Image.asset("images/facebook_logo.png",
                      width: 28,
                      height: 28,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text("Meta-facebook",
                          style: themeController.themeData.textTheme.headlineMedium!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                      Text("META",
                        style: themeController.themeData.textTheme.headlineSmall!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w200
                        ),)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:5.0),
                          child: Text("\$44,181.232",
                            style: themeController.themeData.textTheme.headlineLarge!.copyWith(
                                fontSize: 16,
                                color: const Color(0xB3212121)
                            ),
                          ),
                        ),
                        Text("0.24 (3.14%)",
                          style: themeController.themeData.textTheme.headlineMedium!.copyWith(
                              fontSize: 13,
                              color: const Color(0xB3212121)
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                height: 200,
                child: LineChart(
                  LineChartData(
                    minX: 0,
                    minY: 0,
                    maxX: 6,
                    maxY: 6,
                    gridData: const FlGridData(show: false),
                    titlesData: const FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: Utils.getStocks(7).where((element) => element.title==title).toList().first.spots,
                        isCurved: true,
                        // color: list![index].profitLoss.contains("+")?const Color(0xFF12D18E) : const Color(0xFFF75555),
                        barWidth: 2,
                        isStrokeCapRound: true,
                        dotData: const FlDotData(show: true),
                        belowBarData: BarAreaData(
                            show: true,
                            color: const Color(0x1A12D18E)
                        ),

                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),


        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)
            ),
            elevation: 2.0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0,horizontal: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0,vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Overview",style: themeController.themeData.textTheme.headlineMedium!.copyWith(
                            fontSize: 16
                        ),
                        ),
                        /*Text("Sell all",
                                style: themeController.themeData.textTheme.headlineMedium!.copyWith(
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                  decorationColor: const Color(0xFF0000EE),
                                  decorationThickness: 2,
                                  color: const Color(0xFF0000EE)
                                ),
                              )*/
                      ],
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius:BorderRadius.circular(4.0)
                    ),
                    child: GridView(
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 20.0,
                          mainAxisSpacing: 0.0,
                          crossAxisSpacing: 0.0
                      ),
                      children:  [
                        const RowKeyValue("Volume", "3,500"),
                        const RowKeyValue("Time", "09:51:46"),
                        const Divider(),
                        const Divider(),
                        const RowKeyValue("Avg Price", "8.40"),
                        const RowKeyValue("Total Trade", "4.129"),
                        const Divider(),
                        const Divider(),
                        const RowKeyValue("Upper Cap", "8.64"),
                        RowKeyValue("Lower Lock", "6.64",
                          textStyle: themeController.themeData.textTheme.headlineMedium!.copyWith(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        const Divider(),
                        const Divider(),
                        const RowKeyValue("High", "8.64"),
                        RowKeyValue("Low", "6.64",
                          textStyle: themeController.themeData.textTheme.headlineMedium!.copyWith(
                              color: Colors.red,
                              fontSize: 14
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Card.outlined(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
            ),
            color: Colors.white,
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Card(
                        elevation: 2.0,
                        color: Colors.green,
                        child: Container(
                          width: 70,
                          height: 40,
                          child: Center(
                            child: Text("Buy",
                              style: themeController.themeData.textTheme.headlineMedium!.copyWith(
                                  fontSize: 16,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text("7.90",style: themeController.themeData.textTheme.headlineLarge!.copyWith(
                          color: const Color(0xFF212121),
                          fontSize: 22
                      ),
                      ),
                      Text("152,464",style: themeController.themeData.textTheme.headlineMedium!.copyWith(
                          color: const Color(0xFF212121),
                          fontSize: 16
                      ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        elevation: 2.0,
                        color: Colors.red,
                        child: Container(
                          width: 70,
                          height: 40,
                          child: Center(
                            child: Text("Sell",
                              style: themeController.themeData.textTheme.headlineMedium!.copyWith(
                                  fontSize: 16,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text("7.90",style: themeController.themeData.textTheme.headlineLarge!.copyWith(
                          color: const Color(0xFF212121),
                          fontSize: 22
                      ),),
                      Text("152,464",style: themeController.themeData.textTheme.headlineMedium!.copyWith(
                          color: const Color(0xFF212121),
                          fontSize: 16
                      ),),
                    ],
                  ),

                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
