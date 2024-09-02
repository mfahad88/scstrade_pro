import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/models/index_summary.dart';
import 'package:scstrade_pro/provider/dashboard_provider.dart';
import 'package:scstrade_pro/widgets/button_highlight.dart';
import 'package:scstrade_pro/widgets/card_index.dart';
import 'package:scstrade_pro/widgets/custom_line_chart.dart';
import 'package:scstrade_pro/widgets/drop_index.dart';

import '../../../helper/Utils.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DashboardProvider>().fetchIndices();
    // Timer.periodic(const Duration(seconds: 30), (timer) => context.read<DashboardProvider>().fetchIndices(),);
    return Consumer<DashboardProvider>(builder: (context, provider, child) {
      // provider.selectedIndex = provider.indices!.first.indexCode!;
      return provider.isLoading ? const Center(child: CircularProgressIndicator(),):Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
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
                  Icon(Icons.arrow_drop_up,
                    color: Colors.greenAccent.shade400,),
                   Text(provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.currentIndex!,
                    style: TextStyle(
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
                  Text(provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.volumeTraded!,
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
              padding: EdgeInsets.only(left: 4.0),
              child: Row(
                children: [
                   Text('L: ${provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.lowIndex!}',
                    style: TextStyle(
                        fontSize: 9,
                        color: Colors.red
                    ),
                  ),
                  const Spacer(),
                  Text('H: ${provider.indices!.where((element) => element.indexCode==provider.selectedIndex,).toList().first.highIndex!}',
                    style: TextStyle(
                        fontSize: 9,
                        color: Colors.greenAccent.shade400
                    ),
                  )
                ],
              ),
            ),
            Row(
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
                return Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
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
                        SizedBox(width: 4.0,),
                        ButtonHighlight(
                          title: 'Candle',
                          isSelected: provider.isCandleSelected,
                          onPressed:() {
                            provider.isCandleSelected = true;
                          },
                        ),
                        SizedBox(width: 4.0,),
                        SizedBox(
                          height: 30,
                          child: ListView.separated(
                            clipBehavior: Clip.none,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
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
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      );
    },
    );
  }
}
