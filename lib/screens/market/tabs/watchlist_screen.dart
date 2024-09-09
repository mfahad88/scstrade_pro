import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/data/dto/Stock_data.dart';
import 'package:scstrade_pro/provider/stock_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../helper/Utils.dart';
import '../../../widgets/stock_blue_text.dart';
import '../../../widgets/stock_row_detail_text.dart';

class WatchlistScreen extends StatelessWidget {
  
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StockProvider provider = Provider.of(context,listen: true);
    return ListView.builder(

      itemCount: provider.fetchWatchList.length,
      itemBuilder: (context, index) {
        final item=provider.fetchWatchList[index];
        // var item = provider.selectedSector == provider.sector.first?provider.stocks[index]:provider.stocks.where((element) => element.sn==provider.selectedSector,).toList()[index];
        return Card(
            margin:  const EdgeInsets.symmetric(vertical: 4.0,horizontal: 8.0),
            child: Padding(
              padding:  const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          Visibility(
                            visible: item.ind!.contains('KMI')?true:false,
                            child: Card(
                              color: Colors.yellow.shade600,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 7.0),
                                child: Text('Shariah',
                                  style: TextStyle(
                                      fontSize: 6,
                                      color: Colors.black
                                  ),),
                              ),
                            ),
                          ),
                          Image.network('${item.companyLogo}',width: 25,height: 25,),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${item.sym}',
                            style: const TextStyle(
                                color: Color(0xFF828282),
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Row(
                            children: [
                              const StockRowDetailText(title: 'Vol:'),
                              const SizedBox(width: 2.0,),
                              StockRowDetailText(title: Utils.commaSeparated(item.v!.toDouble()))
                            ],
                          ),
                          StockRowDetailText(title: '${item.nm}'),
                          const Spacer(),
                          Center(child: Container(
                              color: provider.previousStocks!=provider.stocks?Colors.red:Colors.transparent,
                              child: StockBlueText(title: Utils.roundTwoDecimal(item.bp!.toDouble()),))
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          const Spacer(),
                          Container(
                              color: provider.previousStocks!=provider.stocks?Colors.red:Colors.transparent,
                              child: StockBlueText(title: '${item.bv}',))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          const Spacer(),
                          Container(
                              color: provider.previousStocks!=provider.stocks?Colors.red:Colors.transparent,
                              child: StockBlueText(title: Utils.roundTwoDecimal(item.ap!.toDouble()),color: const Color(0xFFAE3197),))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Card(
                                elevation: 0.0,
                                color: item.ch.toString().contains('-')?Colors.red.shade500:Colors.green.shade500,
                                child: SizedBox(
                                  // width: MediaQuery.of(context).size.width * 0.2,
                                  height: 20,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *0.03 ),
                                    child: Center(child: StockBlueText(title: Utils.roundTwoDecimal(item.avgP!.toDouble()),color: Colors.white,)),
                                  ),
                                ),
                              ),

                            ],
                          ),
                          Text('${Utils.roundTwoDecimal(item.ch!.toDouble())} (${Utils.roundTwoDecimal(item.chp!.toDouble())}%)',
                            style: TextStyle(
                                color: item.ch.toString().contains('-')?Colors.red.shade500:Colors.green.shade500,
                                fontSize: 12
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('l: ${item.lp}',
                                style: TextStyle(
                                    color: Colors.red.shade500,
                                    fontSize: 10
                                ),
                              ),
                              const SizedBox(width: 10.0,),
                              Text('h: ${item.hp}',
                                style: TextStyle(
                                    color: Colors.green.shade500,
                                    fontSize: 10
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                              color: provider.previousStocks!=provider.stocks?Colors.red:Colors.transparent,
                              child: StockBlueText(title: '${item.av}',color: const Color(0xFFAE3197),))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
        );


      },
    );
  }
}
