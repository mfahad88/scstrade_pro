import 'package:flutter/material.dart';
import 'package:scstrade_pro/helper/Utils.dart';

import '../data/dto/Index_group.dart';

class DashboardStockCard extends StatelessWidget {
  final IndexGroup? indexGroup;
  const DashboardStockCard({super.key,required this.indexGroup});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: false,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0,top: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                      child: Text(
                        'Shariah',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.0,),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Image.asset('images/spotify_logo.png',width: 30,height: 30,),
                )
              ],
            ),
            SizedBox(width: 4.0,),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${indexGroup?.symbol}',
                      style: const TextStyle(
                          color: Color(0XFF808080),
                          fontSize: 20,
                          fontWeight: FontWeight.w800
                      ),
                    ),
                    Text('${indexGroup?.name}',
                      style: const TextStyle(
                          color: Color(0XFF808080),
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    Text('Vol: ${indexGroup?.volume}',
                      style: const TextStyle(
                          color: Color(0XFF808080),
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                      ),
                    )
                  ],
                )
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0,top: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF26a49a),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0),
                          child: Text('${indexGroup?.closePrice}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                          ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('${indexGroup?.change?.isNegative==false?'+':''}${indexGroup?.change}',
                            style: TextStyle(
                              color: Color(0xFF26a49a),
                              fontSize: 14
                            ),),
                            SizedBox(width: 2.0,),
                            Text('(${indexGroup?.changePercentage?.isNegative==false?'+':''}${Utils.roundTwoDecimal(indexGroup!.changePercentage!.toDouble())})',
                              style: TextStyle(
                                  color: Color(0xFF26a49a),
                                  fontSize: 14
                              ),)
                          ],
                        ),
                      )

                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
