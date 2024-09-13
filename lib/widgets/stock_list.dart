import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/provider/stock_provider.dart';
import 'package:scstrade_pro/widgets/drop_index.dart';
import 'package:scstrade_pro/widgets/stock_blue_text.dart';
import 'package:scstrade_pro/widgets/stock_row_detail_text.dart';
import '../data/dto/Stock_data.dart';
import 'package:http/http.dart' as http;
class StockList extends StatelessWidget {
   StockList({super.key});

  @override
  Widget build(BuildContext context) {

    StockProvider provider=Provider.of(context);
    provider.addSector(provider.stocks!.map((e) => e.sn,).toList());

    return Column(
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
              StockData item = provider.stocks![index];
              _changeOpacity(provider,index);

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

                                      opacity: provider.opacityBp[index].opacity!,
                                      duration: const Duration(seconds: 2),
                                      child: Container(
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: provider.opacityBp[index].isIncreased==false?Colors.yellow.shade200:provider.opacityBp[index].isIncreased==true?Colors.yellow.shade200:Colors.transparent,
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
                                        opacity: provider.opacityBv[index].opacity!,
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

                                      opacity: provider.opacityAp[index].opacity!,
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
                                        provider.addWatchList(item.sym.toString()).then((value) {
                                          if(value==-1){
                                            provider.snackbarKey.currentState?.showSnackBar(const SnackBar(content: Text("Already added to watchlist...")));
                                          }else{
                                            provider.snackbarKey.currentState?.showSnackBar(const SnackBar(content: Text("Added to watchlist...")));
                                          }
                                        },);
                                      },
                                      itemBuilder: (context) {
                                        return [

                                          const PopupMenuItem<String>(value: 'Add',child: ListTile(title: Text('Add to watchlist'),) ,)
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

                                        opacity: provider.opacityAv[index].opacity!,
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
        ),
      ],
    );



  }

  void _changeOpacity(StockProvider provider, int index) {
    Future.delayed(const Duration(seconds: 2),() {
      if(provider.opacityBp[index].opacity!.compareTo(0.0)!=0){
        provider.opacityBp[index].opacity=0.0;
        provider.opacityBp=provider.opacityBp;
      }
      if(provider.opacityBv[index].opacity!.compareTo(0.0)!=0){
        provider.opacityBv[index].opacity=0.0;
        provider.opacityBv=provider.opacityBv;
      }

      if(provider.opacityAp[index].opacity!.compareTo(0.0)!=0){
        provider.opacityAp[index].opacity=0.0;
        provider.opacityAp=provider.opacityAp;
      }
      if(provider.opacityAv[index].opacity!.compareTo(0.0)!=0){
        provider.opacityAv[index].opacity=0.0;
        provider.opacityAv=provider.opacityAv;
      }
    },);
  }




}


