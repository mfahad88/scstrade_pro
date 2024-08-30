import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/stock_provider.dart';

import '../helper/Utils.dart';

class StockList extends StatelessWidget {
  const StockList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          margin: EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Company Logo
                Image.asset(
                  'images/spotify_logo.png', // Replace with actual image URL
                  width: 40,
                  height: 40,
                ),
                SizedBox(width: 8.0),
                Column(
                  children: [
                    Text('SPOT',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.blueGrey.shade700
                    ),
                    ),
                    Text('Spotify',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey.shade300
                      ),
                    )
                  ],
                ),
                SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("HIGH",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500
                      ),),
                    Text("137.96",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.green
                      ),),
                    Text("VOLUME",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500
                      ),),
                    Text('19,500',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.yellow.shade900
                      ),),
                    

                    
                  ],
                ),
                SizedBox(width: 4.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("LOW",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500
                      ),),
                    Text("134",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.red
                      ),),
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(left: 4.0),
                      child: LineChart(
                        LineChartData(
                          minX: 0,
                          minY: 0,
                          maxX: 5,
                          maxY: 5,
                          gridData:  FlGridData(show: false),
                          titlesData:  FlTitlesData(show: false),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: Utils.getStocks(6)[0].spots,
                              isCurved: false,
                              color: Utils.getStocks(6)[0].profitLoss.contains("+")?const Color(0xFF12D18E) : const Color(0xFFF75555),
                              barWidth: 2,
                              isStrokeCapRound: true,
                              dotData: const FlDotData(show: false),
                              belowBarData: BarAreaData(
                                show: true,
                                color: Utils.getStocks(6)[0].profitLoss.contains("+")?const Color(0x1A12D18E) : const Color(0x1AF75555),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 4.0,),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('137',
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 16,
                      fontWeight: FontWeight.w800
                    ),),
                    Row(
                      children: [
                        Icon(Icons.arrow_drop_up,color: Colors.green,),
                        Text('+0.63(0.46%)',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.w700
                        ),),

                      ],
                    ),
                    Row(
                      children: [
                        Text("Buy: ",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                        ),),
                        Text('8/11,000.45',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            color: Colors.red.shade300
                          ),)
                      ],
                    ),
                    Row(
                      children: [
                        Text("Sell: ",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400
                          ),),
                        Text('11/20,000.45',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: Colors.green.shade300
                          ),)
                      ],
                    )
                  ],
                ),


              ],
            ),
          ),
        )
      ],
    );
  }
}
