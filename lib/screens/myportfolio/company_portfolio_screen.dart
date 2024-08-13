import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';

class CompanyPortfolioScreen extends StatelessWidget {
  final String? title;
  const CompanyPortfolioScreen({super.key,this.title});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=context.read();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    height: 200,
                    child: Card(
                      color: Colors.white,
                      elevation: 2.0,
                      clipBehavior: Clip.antiAlias,
                      child: LineChart(
                        LineChartData(
                          minX: 0,
                          minY: 0,
                          maxX: 6,
                          maxY: 6,
                          gridData: const FlGridData(show: true),
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
                              /*belowBarData: BarAreaData(
                                  show: false,
                                  color: list![index].profitLoss.contains("+")?const Color(0x1A12D18E) : const Color(0x1AF75555)
                              ),*/

                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
             Padding(
               padding: const EdgeInsets.only(top: 10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Container(
                     width: 150,
                     height: 110,
                     child: Card.outlined(
                       color: Colors.white,
                       elevation: 5,
                       child: Padding(
                         padding: const EdgeInsets.only(top: 7),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Center(
                               child: Card(
                                 elevation: 5.0,
                                 clipBehavior: Clip.none,
                                 shadowColor: const Color(0xFF00933F),
                                 color: const Color(0xFF00933F),
                                 child: Padding(
                                   padding: const EdgeInsets.only(top: 2,bottom: 2,left: 20,right: 20),
                                   child: Text("Buy",style: themeController.themeData.textTheme.headlineMedium!.copyWith(
                                       color: Colors.white,
                                       fontSize: 14
                                   ),),
                                 ),
                               ),
                             ),
                             Text("7.88",style: themeController.themeData.textTheme.headlineLarge!.copyWith(
                                 color: const Color(0xFF212121),
                                 fontSize: 22
                             ),),
                             Text("1,500",style: themeController.themeData.textTheme.headlineMedium!.copyWith(
                                 color: const Color(0xFF212121),
                                 fontSize: 16
                             ),),

                           ],
                         ),
                       ),
                     ),
                   ),
                   Container(
                     width: 150,
                     height: 110,
                     child: Card.outlined(
                       color: Colors.white,
                       elevation: 5,
                       child: Padding(
                         padding: const EdgeInsets.only(top: 7),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Center(
                               child: Card(
                                 elevation: 5.0,
                                 clipBehavior: Clip.none,
                                 shadowColor: const Color(0xFFDB0712),
                                 color: const Color(0xFFDB0712),
                                 child: Padding(
                                   padding: const EdgeInsets.only(top: 2,bottom: 2,left: 20,right: 20),
                                   child: Text("Sell",style: themeController.themeData.textTheme.headlineMedium!.copyWith(
                                       color: Colors.white,
                                       fontSize: 14
                                   ),),
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
                       ),
                     ),
                   )
                 ],
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
