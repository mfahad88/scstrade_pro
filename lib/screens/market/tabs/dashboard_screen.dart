import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/data/dto/Index_group.dart';
import 'package:scstrade_pro/data/dto/Stock_data.dart';
import 'package:scstrade_pro/models/index_summary.dart';
import 'package:scstrade_pro/provider/dashboard_provider.dart';
import 'package:scstrade_pro/provider/stock_provider.dart';
import 'package:scstrade_pro/widgets/button_highlight.dart';
import 'package:scstrade_pro/widgets/card_index.dart';
import 'package:scstrade_pro/widgets/custom_line_chart.dart';
import 'package:scstrade_pro/widgets/dashboard_stock_card.dart';
import 'package:scstrade_pro/widgets/drop_index.dart';

import '../../../helper/Utils.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Timer? timer;
  @override
  void initState() {
    context.read<DashboardProvider>().fetchIndices(true);
    timer=Timer.periodic(const Duration(seconds: 5), (timer) => context.read<DashboardProvider>().fetchIndices(false),);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Consumer<DashboardProvider>(builder: (context, provider, child) {
      return provider.isLoading ? const Center(child: CircularProgressIndicator(),):Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: provider.indices!.length,
                        itemBuilder: (context, index) {
                          return CardIndex(provider.indices![index]);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: DropIndex(
                        value: provider.selectedIndex!,
                        items: provider.indices!.map((e) => e.indexCode,).toList(),
                        onChanged: (value) {
                          provider.selectedIndex = value;
                        },
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.netChange!.contains('-')?Icons.arrow_drop_down:Icons.arrow_drop_up,
                      color: provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.netChange!.contains('-')?Colors.redAccent.shade400:Colors.greenAccent.shade400,),
                    Text(provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.currentIndex!,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black45
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Row(
                  children: [
                    const Text("Volume: ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black45
                      ),
                    ),
                    Text(Utils.formatToMillions(int.parse(provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.volumeTraded!)),
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45
                      ),
                    ),
                    const Spacer(),
                    Text('${Utils.roundTwoDecimal(double.parse(provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.currentIndex!))}(${Utils.roundTwoDecimal((double.parse(provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.netChange!)/provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.preClose!.toDouble())*100)}%)',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.greenAccent.shade400
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Row(
                  children: [
                    Text('L: ${Utils.commaSeparated(double.parse(provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.lowIndex!))} -${Utils.roundTwoDecimal(double.parse(provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.lowIndex!)- provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.preClose!)} (${Utils.roundTwoDecimal(((provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.preClose! - double.parse(provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.lowIndex!))*100)/provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.preClose!)}%)',
                      style: const TextStyle(
                          fontSize: 9,
                          color: Colors.red
                      ),
                    ),
                    const Spacer(),
                    Text('H: ${Utils.commaSeparated(double.parse(provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.highIndex!))} +${Utils.roundTwoDecimal(double.parse(provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.highIndex!)- provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.preClose!)} (${Utils.roundTwoDecimal(((double.parse(provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.highIndex!) - provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.preClose!)*100)/provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.preClose!)}%)',
                      style: TextStyle(
                          fontSize: 9,
                          color: Colors.greenAccent.shade400
                      ),
                    )
                  ],
                ),
              ),
              const Row(
                children: [
                  Expanded(
                    child: Card.outlined(
                      clipBehavior: Clip.antiAlias,
                      child: SizedBox(
                          width: 150,
                          height: 200,
                          child: CustomLineChart()
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 4,),
              Consumer<DashboardProvider>(
                builder: (BuildContext context, DashboardProvider provider, Widget? child) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 7.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ButtonHighlight(
                            title: 'Line',
                            isSelected: provider.isLineSelected,
                            onPressed: () {
                              provider.isLineSelected = true;
                            },
                          ),
                          const SizedBox(width: 4.0,),
                          ButtonHighlight(
                            title: 'Candle',
                            isSelected: provider.isCandleSelected,
                            onPressed:() {
                              provider.isCandleSelected = true;
                            },
                          ),
                          const SizedBox(width: 4.0,),
                          SizedBox(
                            height: 30,
                            child: ListView.separated(
                              clipBehavior: Clip.none,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.isTime.length,
                              itemBuilder: (context, index) {
                                String title='';
                                switch (index){

                                }

                                return ButtonHighlight(
                                  title: 'Candle',
                                  isSelected: provider.isTime[index],
                                  onPressed:() {

                                    for(int i=0;i<provider.isTime.length;i++){
                                      if(i==index){
                                        provider.isTime[i] = true;
                                      }else{
                                        provider.isTime[i] = false;
                                      }
                                    }
                                    provider.isTime=provider.isTime;
                                  },
                                );
                              }, separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(width: 4.0,);
                            },
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                },
              ),
              Consumer<StockProvider>(builder: (BuildContext context, StockProvider value, Widget? child) {
                List<StockData> volumnLeaders= List.from(value.stockData)..sort((a, b) => b.v!.compareTo(a.v!),);
                List<StockData> gainers= List.from(value.stockData)..sort((a, b) => b.ch!.compareTo(a.ch!),);
                List<StockData> losers= List.from(value.stockData)..sort((a, b) => a.ch!.compareTo(b.ch!),);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10.0,),
                    const Padding(
                      padding: EdgeInsets.only(left: 7.0),
                      child: Text('Volume Leaders',
                        style: TextStyle(
                            color: Color(0xFF808080),
                            fontSize: 16,
                            fontWeight: FontWeight.w800
                        ),
                      ),
                    ),

                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:volumnLeaders.isEmpty?0:volumnLeaders.sublist(0,10).length,
                        itemBuilder: (context, index) => DashboardStockCard(stockData:volumnLeaders[index] ,)),
                    const SizedBox(height: 20.0,),
                    const Padding(
                      padding: EdgeInsets.only(left:7.0),
                      child: Text('Gainers',
                        style: TextStyle(
                            color: Color(0xFF808080),
                            fontSize: 16,
                            fontWeight: FontWeight.w800
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: gainers.isEmpty?0:gainers.sublist(0,10).length,
                        itemBuilder: (context, index) => DashboardStockCard(stockData: gainers[index],)),
                    const SizedBox(height: 20.0,),
                    const Padding(
                      padding: EdgeInsets.only(left: 7.0),
                      child: Text('Losers',
                        style: TextStyle(
                            color: Color(0xFF808080),
                            fontSize: 16,
                            fontWeight: FontWeight.w800
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: losers.isEmpty?0:losers.sublist(0,10).length,
                        itemBuilder: (context, index) => DashboardStockCard(stockData: losers[index],))
                  ],
                );
              },

              )
            ],
          ),
        ),
      );
    },);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
