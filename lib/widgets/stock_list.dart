import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/provider/stock_provider.dart';
import 'package:scstrade_pro/widgets/drop_index.dart';
import 'package:scstrade_pro/widgets/stock_blue_text.dart';
import 'package:scstrade_pro/widgets/stock_row_detail_text.dart';
import '../data/dto/Stock_data.dart';
class StockList extends StatelessWidget {
  final List<StockData>? list;
  final String screenName;
  const StockList({super.key, required this.list,required this.screenName});

  @override
  Widget build(BuildContext context) {
    StockProvider provider=Provider.of(context,listen: true);
    // provider.addSector(provider.stocks!.map((e) => e.sn,).toList());


    return Expanded(
      child: ListView.builder(

        itemCount: list!.length,
        itemBuilder: (context, index) {
          StockData item = list![index];
          // _changeOpacity(provider,index);

          return Card(
              margin:  const EdgeInsets.symmetric(vertical: 4.0,horizontal: 8.0),
              child: Padding(
                padding:  const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                            maxHeight: 100
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: item.ind!.contains('KMI')?true:false,
                              child: Card(
                                clipBehavior: Clip.none,
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

                            Image.network('${item.companyLogo}',
                                width: 40,
                                height: 40
                            ),

                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                            minHeight: 100,
                            maxHeight: 100
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${item.sym}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: true,
                              style: const TextStyle(
                                  color: Color(0xFF828282),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const StockRowDetailText(title: 'Vol:'),
                                const SizedBox(width: 2.0,),
                                StockRowDetailText(title: Utils.commaSeparated(item.v!.toDouble()))
                              ],
                            ),
                            StockRowDetailText(title: '${item.nm}'),
                            const Spacer(),
                            Stack(
                              children: [

                                AnimatedOpacity(

                                  opacity: screenName=="Stocks"?provider.opacityBp[index].opacity!:provider.opacityWatchListBp[index].opacity??0.0,
                                  duration: const Duration(seconds: 2),
                                  child: Container(
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: /*provider.opacityBp[index].isIncreased==false?Colors.yellow.shade200:provider.opacityBp[index].isIncreased==true?Colors.yellow.shade200:Colors.transparent*/Colors.yellow.shade200,
                                        borderRadius: BorderRadius.circular(10.0)
                                    ),

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: StockBlueText(title: Utils.roundTwoDecimal(item.bp!.toDouble()),)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child:
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                            maxHeight: 100
                        ),
                        child: Column(
                          children: [
                            const Spacer(),
                            Stack(
                                children:[
                                  AnimatedOpacity(
                                    opacity: screenName=="Stocks"?provider.opacityBp[index].opacity!:provider.opacityWatchListBv[index].opacity??0.0,
                                    duration: const Duration(seconds: 2),
                                    child:  Container(
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: /*provider.opacityBv[index].isIncreased==false?Colors.red:provider.opacityBv[index].isIncreased==true?Colors.green:Colors.transparent*/Colors.yellow.shade200,
                                          borderRadius: BorderRadius.circular(10.0)
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
                      child:
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                            maxHeight: 100
                        ),
                        child: Column(
                          children: [
                            const Spacer(),
                            Stack(
                              children:[
                                AnimatedOpacity(

                                  opacity: screenName=="Stocks"?provider.opacityAp[index].opacity!:provider.opacityWatchListAp[index].opacity??0.0,
                                  duration: const Duration(seconds: 2),
                                  child: Container(
                                      height: 20,
                                      decoration:BoxDecoration(
                                          color:/*provider.opacityAp[index].isIncreased==false?Colors.red:provider.opacityAp[index].isIncreased==true?Colors.green:Colors.transparent*/Colors.yellow.shade200,
                                          borderRadius: BorderRadius.circular(10.0)
                                      )
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
                      flex: 2,
                      child:
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                            maxHeight: 100
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Card(
                                  elevation: 0.0,
                                  color: item.ch.toString().contains('-')?Colors.red.shade500:Colors.green.shade500,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 10.0),
                                    child: Center(child: StockBlueText(title: Utils.roundTwoDecimal(item.avgP!.toDouble()),color: Colors.white,)),
                                  ),
                                ),
                                PopupMenuButton<String>(
                                  child: Container(
                                    width: 20,
                                    height: 30,
                                    child: const Icon(
                                        Icons.more_vert
                                    ),
                                  ),
                                  onSelected: (v) {
                                    if(v=="Add") {
                                      provider.addWatchList(item.sym.toString())
                                          .then((value) {
                                        if (value == -1) {
                                          provider.snackbarKey.currentState
                                              ?.showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Already added to watchlist...")));
                                        } else {
                                          provider.snackbarKey.currentState
                                              ?.showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Added to watchlist...")));
                                        }
                                      },);
                                    }else{
                                      provider.removeWatchList(item.sym.toString()).then((value) {
                                        if(value==-1){
                                          provider.snackbarKey.currentState
                                              ?.showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Unable to remove...")));
                                        }else{
                                          provider.snackbarKey.currentState
                                              ?.showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Removed Successfully...")));
                                          provider.fetchWatchList();
                                        }
                                      },);
                                    }
                                  },
                                  itemBuilder: (context) {
                                    return [

                                      screenName=='Stocks'? const PopupMenuItem<String>(value: 'Add',child: ListTile(title: Text('Add to watchlist'),) ,):const PopupMenuItem<String>(value: 'Remove',child: ListTile(title: Text('Remove from watchlist'),) ,)
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
                              alignment: Alignment.center,
                              children: [
                                AnimatedOpacity(

                                    opacity: screenName=="Stocks"?provider.opacityAv[index].opacity!:provider.opacityWatchListAv[index].opacity??0.0,
                                    duration: const Duration(seconds: 2),
                                    child:
                                    Container(
                                      width: 80,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: /*provider.opacityAv[index].isIncreased==false?Colors.red:provider.opacityAv[index].isIncreased==true?Colors.green:Colors.transparent*/Colors.yellow.shade200,
                                          borderRadius: BorderRadius.circular(10.0)
                                      ),
                                    )

                                ),
                                StockBlueText(title: '${item.av}',color: const Color(0xFFAE3197)
                                )
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
    );



  }



}


