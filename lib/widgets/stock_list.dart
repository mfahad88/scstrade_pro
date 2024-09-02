import 'package:flutter/material.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/widgets/stock_blue_text.dart';
import 'package:scstrade_pro/widgets/stock_row_detail_text.dart';
import '../data/dto/Stock_data.dart';

class StockList extends StatelessWidget {
  final List<StockData> list;
  const StockList({super.key,required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Card(
                      color: Colors.yellow.shade600,
                      child: Visibility(
                        visible: false,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 7.0),
                          child: Text('Shariah',
                            style: TextStyle(
                                fontSize: 6,
                                color: Colors.black
                            ),),
                        ),
                      ),
                    ),
                    Image.asset('images/spotify_logo.png',width: 25,height: 25,),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SizedBox(
                    width: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${list[index].sym}',
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Row(
                          children: [
                            StockRowDetailText(title: 'Vol:'),
                            SizedBox(width: 2.0,),
                            StockRowDetailText(title: '${list[index].v}')
                          ],
                        ),
                        StockRowDetailText(title: '${list[index].nm}'),
                        SizedBox(height: 4.0,),
                        StockBlueText(title: '${list[index].bv}',)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SizedBox(
                    width: 40,
                    child: Column(
                      children: [
                        SizedBox(height: 16,),
                        SizedBox(height: 12,),
                        SizedBox(height: 14,),
                        SizedBox(height: 14,),
                        StockBlueText(title: '${list[index].bp}',)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SizedBox(
                    width: 40,
                    child: Column(
                      children: [
                        SizedBox(height: 16,),
                        SizedBox(height: 12,),
                        SizedBox(height: 14,),
                        SizedBox(height: 14,),
                        StockBlueText(title: '${list[index].av}',color: Color(0xFFFF00FF),)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: SizedBox(
                    width: 80,
                    child: Column(
                      children: [
                        Card(
                          elevation: 0.0,
                          color: Colors.redAccent.shade200,
                          child: SizedBox(
                            width: 60,
                            height: 20,
                            child: Center(child: StockBlueText(title: '${Utils.roundTwoDecimal(list[index].avgP!.toDouble())}',color: Colors.white,)),
                          ),
                        ),
                        StockRowDetailText(title: '-1.18 (-9.97%)' ,color: Colors.red,),
                        Row(
                          children: [
                            Text('l: ${list[index].lp}',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.red
                              ),),
                            SizedBox(width: 5.0,),
                            Text('h: ${list[index].hp}',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.green
                              ),),
                          ],
                        ),
                        StockBlueText(title: '${list[index].ap}',color: Color(0xFFFF00FF),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
    );
  }
}
