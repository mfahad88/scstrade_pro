import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';
import 'package:scstrade_pro/widgets/portfolio_my_account.dart';

import '../../helper/Utils.dart';
import '../../widgets/heading_with_arrow.dart';
import '../../widgets/my_stock_grid.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=context.read();
    return Expanded(
      child: ShaderMask(
        shaderCallback: (Rect rect) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ Colors.transparent, Utils.isDark(context)?const Color(0xFF1F222A):Colors.white],
            //set stops as par your requirement
            stops: const [0.95, 1.0], // 50% transparent, 50% white
          ).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.30,
                    image:  const AssetImage(
                        'images/frame.png'),
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: LineChart(
                        LineChartData(
                          minX: 0,
                          minY: 0,
                          maxX: 10,
                          maxY: 10,
                          gridData: const FlGridData(show: false),
                          titlesData: const FlTitlesData(show: false),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: Utils.randomNumbers(20),
                              isCurved: false,
                              color: Colors.white,
                              // color: list![index].profitLoss.contains("+")?const Color(0xFF12D18E) : const Color(0xFFF75555),
                              barWidth: 2,
                              isStrokeCapRound: true,
                              dotData: const FlDotData(show: false),
                              belowBarData: BarAreaData(
                                show: false,
                                // color: list![index].profitLoss.contains("+")?const Color(0x1A12D18E) : const Color(0x1AF75555),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Card.outlined(
                child:Column(
                  children: [
                    Text("\$196,548.50",style: themeController.themeData.textTheme.headlineLarge!.copyWith(
      
                    ),),
                    Text("\$66,378.49")
                  ],
                ) ,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 7),
                child: Text("My Account",style: themeController.themeData.textTheme.headlineMedium!.copyWith(
                    color: Utils.isDark(context)?Colors.white:const Color(0xFF1F222A)
                )),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10,right: 10),
                child: GridView(gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0, // The maximum extent of each grid item
                  mainAxisSpacing: 10.0, // Spacing between items in the main axis (vertical)
                  crossAxisSpacing: 10.0, // Spacing between items in the cross axis (horizontal)
                  childAspectRatio: 2.0, // The ratio of width to height of each item
                ),
                  shrinkWrap: true,
                  children:  const [
                    PortfolioMyAccount(title: "Cash Available",amount: "\$23,087.39",assetName: 'images/cash_available.png',),
                    PortfolioMyAccount(title: "Equity",amount: "\$23,087.39",assetName: 'images/equity.png',),
                    PortfolioMyAccount(title: "Pending Buys",amount: "\$23,087.39",assetName: 'images/pending_buys.png',),
                    PortfolioMyAccount(title: "Total Returns",amount: "\$23,087.39",assetName: 'images/total_returns.png',),
                  ],),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 7),
                child: HeadingWithArrow(title: "My Positions", onPressed: () {

                },),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MyStockGrid(list: Utils.getStocks(6)))
            ],
          ),
        ),
      ),
    );
  }
}
