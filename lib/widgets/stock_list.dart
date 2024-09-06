import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/database/scs_database.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/provider/stock_provider.dart';
import 'package:scstrade_pro/widgets/drop_index.dart';
import 'package:scstrade_pro/widgets/stock_blue_text.dart';
import 'package:scstrade_pro/widgets/stock_row_detail_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/dto/Stock_data.dart';

class StockList extends StatelessWidget {
  StockList({super.key});

  @override
  Widget build(BuildContext context) {
    final db=ScsDatabase.instance;
    StockProvider stockProvider=context.read<StockProvider>();
    stockProvider.addSector(stockProvider.stocks!.map((e) => e.sn,).toList());
    Future.delayed(const Duration(seconds: 5),() {
      stockProvider.opacity.forEach((element) => element==1.0?0.0:0.0,);
    },);

    return Consumer<StockProvider>(

      builder: (BuildContext context, StockProvider provider, Widget? child) {
      /*  for(int i=0;i<provider.stocks!.length;i++){
          if(provider.previousStocks[i].bv!=provider.stocks?[i].bv){
            provider.opacity[i]=1.0;
          }
        }*/
        return  Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropIndex(
                    value: provider.selectedSector,
                    items: provider.sector.toList(),
                    onChanged: (value) {
                      provider.selectedSector=value;
                    },
                  ),

                  DropIndex(
                    value: provider.selectedFilter,
                    items: provider.filterMenu.toList(),
                    onChanged: (value) {
                      provider.selectedFilter=value;
                    },
                  ),
                  DropIndex(
                    value: provider.selectedIndex,
                    items: provider.indices.toList(),
                    onChanged: (value) {
                      provider.selectedIndex=value;
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(

                itemCount: provider.stocks!.length,
                itemBuilder: (context, index) {
                  // var item = provider.selectedSector == provider.sector.first?provider.stocks[index]:provider.stocks.where((element) => element.sn==provider.selectedSector,).toList()[index];
                  StockData item = provider.stocks![index];


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
                                    Center(
                                        child: Stack(
                                          children: [
                                            Container(
                                              color: provider.previousStocks[index].bp!=provider.stocks![index].bp?Colors.red:Colors.transparent,
                                            ),
                                            StockBlueText(title: Utils.roundTwoDecimal(item.bp!.toDouble()),)
                                          ],
                                        )
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
                                    Stack(
                                        children:[
                                          AnimatedOpacity(

                                            opacity: provider.opacity[index],
                                            duration: Duration(seconds: 2),
                                            child: Container(
                                              width: 40,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  color: provider.previousStocks[index].bv==provider.stocks![index].bv?Colors.red:Colors.transparent,
                                                  borderRadius: BorderRadius.circular(8.0)
                                              ),

                                            ),
                                          ),
                                          Center(child: StockBlueText(title: '${item.bv}',))
                                        ]
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
                                    Stack(
                                      children:[
                                        AnimatedOpacity(

                                          opacity: provider.opacity[index],
                                          duration: const Duration(seconds: 2),
                                          child: Container(
                                            width: 50,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                color: provider.previousStocks![index].ap==provider.stocks![index].ap?Colors.red:Colors.transparent,
                                                borderRadius: BorderRadius.circular(8.0)
                                            ),
                                          ),
                                        ),
                                        Center(child: StockBlueText(title: Utils.roundTwoDecimal(item.ap!.toDouble()),color: const Color(0xFFAE3197),))
                                      ]
                                      ,
                                    )
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

                                        PopupMenuButton<String>(

                                          onSelected: (v) {
                                            provider.addWatchList(item.sym.toString());
                                            // asyncPref.setString(item.sym.toString() , item.nm.toString());
                                            /*asyncPref.getStringList('watchList').then((value) {
                                              value?.add(item.sym!);
                                              asyncPref.setStringList('watchList', value!)  ;
                                            },);*/
                                          },
                                          itemBuilder: (context) {
                                            return [
                                               const PopupMenuItem<String>(child: ListTile(title: Text('Add to watchlist'),) ,value: 'Add to watchlist',)
                                            ];
                                          },
                                        )
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
                                    Stack(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              color: provider.previousStocks![index].ap==provider.stocks![index].ap?Colors.red:Colors.transparent,
                                              borderRadius: BorderRadius.circular(8.0)
                                          ),
                                        ),
                                        StockBlueText(title: '${item.av}',color: const Color(0xFFAE3197))
                                      ],

                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                  );
                },
              ),
            ),
          ],
        );
      },

    );

  }


}
