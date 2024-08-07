import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/models/MyStock.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';
import 'package:scstrade_pro/screens/dashboard/my_wishlist.dart';
import 'package:scstrade_pro/screens/dashboard/my_wishlist_screen.dart';
import 'package:scstrade_pro/widgets/heading_with_arrow.dart';
import 'package:scstrade_pro/widgets/my_card.dart';
import 'package:scstrade_pro/widgets/my_stock_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=context.read();
    return Expanded(
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 140,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children:  [
                  MyCard(
                    width: 120,
                    height: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10,top: 5),
                              child: Text(
                                "DOW",style: themeController.themeData.textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w600
                              ),
                              ),
                            )

                        ),
                        Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Text(
                                "+ 3.57%",style: themeController.themeData.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF12D18E),
                              ),
                              ),
                            )

                        ),
                        Expanded(
                          child: Container(
                            constraints: const BoxConstraints(
                                maxHeight: 140,
                                minHeight: 100,
                                maxWidth: 120,
                                minWidth: 90
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
                                    spots: [
                                      const FlSpot(0, 5),
                                      const FlSpot(1, 3.5),
                                      const FlSpot(2, 4),
                                      const FlSpot(3, 3),
                                      const FlSpot(4, 4),
                                      const FlSpot(5, 5)
                                    ],
                                    isCurved: false,
                                    color: const Color(0xFF12D18E),
                                    barWidth: 2,
                                    isStrokeCapRound: true,
                                    dotData: const FlDotData(show: false),
                                    belowBarData: BarAreaData(show: false),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  MyCard(
                    width: 120,
                    height: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10,top: 5),
                              child: Text(
                                "S&P 500",style: themeController.themeData.textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w600
                              ),
                              ),
                            )

                        ),
                        Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Text(
                                "- 1.96%",style: themeController.themeData.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFF75555),
                              ),
                              ),
                            )

                        ),
                        Expanded(
                          child: Container(
                            constraints: const BoxConstraints(
                                maxHeight: 140,
                                minHeight: 100,
                                maxWidth: 120,
                                minWidth: 90
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
                                    spots: [
                                      const FlSpot(0, 5),
                                      const FlSpot(1, 3.5),
                                      const FlSpot(2, 4),
                                      const FlSpot(3, 3),
                                      const FlSpot(4, 4),
                                      const FlSpot(5, 5)
                                    ],
                                    isCurved: false,
                                    color: const Color(0xFFF75555),
                                    barWidth: 2,
                                    isStrokeCapRound: true,
                                    dotData: const FlDotData(show: false),
                                    belowBarData: BarAreaData(show: false),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  MyCard(
                    width: 120,
                    height: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10,top: 5),
                              child: Text(
                                "NASDAQ",style: themeController.themeData.textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w600
                              ),
                              ),
                            )

                        ),
                        Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Text(
                                "+ 2.85%",style: themeController.themeData.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF12D18E),
                              ),
                              ),
                            )

                        ),
                        Expanded(
                          child: Container(
                            constraints: const BoxConstraints(
                                maxHeight: 140,
                                minHeight: 100,
                                maxWidth: 120,
                                minWidth: 90
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
                                    spots: [
                                      const FlSpot(0, 5),
                                      const FlSpot(1, 3.5),
                                      const FlSpot(2, 4),
                                      const FlSpot(3, 3),
                                      const FlSpot(4, 4),
                                      const FlSpot(5, 5)
                                    ],
                                    isCurved: false,
                                    color: const Color(0xFF12D18E),
                                    barWidth: 2,
                                    isStrokeCapRound: true,
                                    dotData: const FlDotData(show: false),
                                    belowBarData: BarAreaData(show: false),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),


                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10,left: 20,right: 20),
                child: HeadingWithArrow(title: "My wishlist", onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyWishlistScreen()));
                },)
            ),
            Container(
              margin: const EdgeInsets.only(top: 10,),
              child: const MyWishlist(),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10,left: 20,right: 20),
                child: HeadingWithArrow(title: "My Stocks", onPressed: () {

                },)
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MyStockGrid(list: getStocks()))
          ],
        ),
      ),
    );
  }

  List<MyStock> getStocks(){
    return [
      MyStock(image: 'images/spotify_logo.png', title: 'Spotify', shortName: 'SPOT', totalAmount: '\$71.05', profitLoss: '+ 2.94%', spots: [
        const FlSpot(0, 5),
        const FlSpot(1, 3.5),
        const FlSpot(2, 4),
        const FlSpot(3, 3),
        const FlSpot(4, 4),
        const FlSpot(5, 5)
      ]),
      MyStock(image: 'images/facebook_logo.png', title: 'Meta - Facebook', shortName: 'META', totalAmount: '\$90.79', profitLoss: '- 2.16%', spots: [
        const FlSpot(0, 5),
        const FlSpot(1, 3.5),
        const FlSpot(2, 4),
        const FlSpot(3, 3),
        const FlSpot(4, 4),
        const FlSpot(5, 5)
      ]),
      MyStock(image: 'images/tesla_logo.png', title: 'Tesla', shortName: 'TSLA', totalAmount: '\$207.47', profitLoss: '+ 2.37%', spots: [
        const FlSpot(0, 5),
        const FlSpot(1, 3.5),
        const FlSpot(2, 4),
        const FlSpot(3, 3),
        const FlSpot(4, 4),
        const FlSpot(5, 5)
      ]),
      MyStock(image: 'images/facebook_logo.png', title: 'Meta - Facebook', shortName: 'META', totalAmount: '\$90.79', profitLoss: '- 2.16%', spots: [
        const FlSpot(0, 5),
        const FlSpot(1, 3.5),
        const FlSpot(2, 4),
        const FlSpot(3, 3),
        const FlSpot(4, 4),
        const FlSpot(5, 5)
      ]),
      MyStock(image: 'images/spotify_logo.png', title: 'Spotify', shortName: 'SPOT', totalAmount: '\$71.05', profitLoss: '+ 2.94%', spots: [
        const FlSpot(0, 5),
        const FlSpot(1, 3.5),
        const FlSpot(2, 4),
        const FlSpot(3, 3),
        const FlSpot(4, 4),
        const FlSpot(5, 5)
      ]),
      MyStock(image: 'images/spotify_logo.png', title: 'Spotify', shortName: 'SPOT', totalAmount: '\$71.05', profitLoss: '+ 2.94%', spots: [
        const FlSpot(0, 5),
        const FlSpot(1, 3.5),
        const FlSpot(2, 4),
        const FlSpot(3, 3),
        const FlSpot(4, 4),
        const FlSpot(5, 5)
      ])
    ];

  }

}
