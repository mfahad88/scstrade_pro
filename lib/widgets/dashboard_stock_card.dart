import 'package:flutter/material.dart';
import 'package:scstrade_pro/helper/Utils.dart';

import '../data/dto/Index_group.dart';
import '../data/dto/Stock_data.dart';

class DashboardStockCard extends StatelessWidget {
  final StockData? stockData;
  const DashboardStockCard({super.key,required this.stockData});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(8.0),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: stockData!.ind!.toLowerCase().contains('kmi')?true:false,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0,top: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                        child: const Text(
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
                  const SizedBox(height: 5.0,),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Image.network(stockData!.companyLogo!,width: 30 ,height: 30,),
                  )
                ],
              ),
            ),
            const SizedBox(width: 4.0,),
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${stockData?.sym}',
                      style: const TextStyle(
                          color: Color(0XFF808080),
                          fontSize: 17,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Text('${stockData?.nm}',
                      style: const TextStyle(
                          color: Color(0XFF808080),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis
                      ),
                    ),
                    Text('Vol: ${stockData?.v}',
                      style: const TextStyle(
                          color: Color(0XFF808080),
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),
                    )
                  ],
                )
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0,top: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                      Container(
                        width:90,
                        decoration: BoxDecoration(
                          color: stockData?.ch?.isNegative==false?const Color(0xFF26a49a):Colors.red.shade500,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0),
                          child: Center(
                            child: Text('${stockData?.cl}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('${stockData?.ch?.isNegative==false?'+':''}${stockData?.ch}',
                            style: TextStyle(
                              color: stockData?.ch?.isNegative==false?const Color(0xFF26a49a):Colors.red.shade500,
                              fontSize: 14
                            ),),
                            const SizedBox(width: 2.0,),
                            Text('(${stockData?.chp?.isNegative==false?'+':''}${Utils.roundTwoDecimal(stockData?.chp?.toDouble()??0.0)}%)',
                              style: TextStyle(
                                  color: stockData?.ch?.isNegative==false?const Color(0xFF26a49a):Colors.red.shade500,
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
