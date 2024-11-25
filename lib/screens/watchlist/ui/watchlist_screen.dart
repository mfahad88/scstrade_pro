import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/data/dto/Stock_data.dart';
import 'package:scstrade_pro/screens/dashboard/ui/widgets/title_listview.dart';
import 'package:scstrade_pro/screens/dashboard/viewmodel/dashboard_viewmodel.dart';
import 'package:scstrade_pro/screens/viewmodel/shared_viewmodel.dart';
import 'package:scstrade_pro/screens/watchlist/viewmodel/watchlist_viewmodel.dart';
import 'package:scstrade_pro/widgets/drop_index.dart';

import '../../../widgets/stock_row.dart';
import '../../dashboard/ui/widgets/portfolio_card.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SharedViewModel>(
      builder: (BuildContext context, SharedViewModel value, Widget? child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            double width=constraints.maxWidth;
            double height=constraints.maxHeight;
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width*0.03,
                vertical: height*0.02
              ),
              child: Consumer<WatchListViewModel>(
                builder: (BuildContext context, WatchListViewModel watchList, Widget? child) {
                  return ListView(
                    children: [
                      const PortfolioCard(),
                      Gap(5),
                      SingleChildScrollView(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(5, (index) {
                            return Padding(
                              padding: EdgeInsets.only(right: width*0.01),
                              child: FilledButton(onPressed: () => watchList.selectedIndex=index,
                                child: Text(index==0?'Shahriah':index==1?'Future':index==2?'Sector':index==3?'ETF':'Cap'),
                                style: FilledButton.styleFrom(
                                    backgroundColor:  index==watchList.selectedIndex?Color(0xFF48C0E0):Color(0xFFF5F5F5),
                                    foregroundColor: index==watchList.selectedIndex?Colors.white:Color(0xFF3A3A3A),
                                ),
                              ),
                            );
                          },
                          ),
                        ),
                      ),
                      Gap(5),
                      Visibility(
                        visible: watchList.selectedIndex==2?true:false,
                          child: DropIndex(
                            value: value.selectedValue,
                            isExpanded: true,
                            items: value.stockData.map((e) => e.sn,).toSet().toList(), onChanged: (v) {
                            value.selectedValue=v;
                          },
                          )
                      ),
                     TitleListview(width: width, indexGroups: watchList.selectedIndex==0?value.stockData.where((element) => element.ind?.contains('KMI')??false,).toList():watchList.selectedIndex==1?
                     value.stockData.where((element) => element.sym?.contains('-')??false,).toList() :watchList.selectedIndex==2?
                     value.stockData.where((element) => element.sn==value.selectedValue,).toList() :value.stockData,)
                     /* ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: watchList.selectedIndex==0?value.stockData.where((element) => element.ind?.contains('KMI')??false,).toList().length:watchList.selectedIndex==1?
                            value.stockData.where((element) => element.sym?.contains('-')??false,).toList().length :watchList.selectedIndex==2?
                        value.stockData.where((element) => element.sn==value.selectedValue,).toList().length :value.stockData.length,
                        itemBuilder: (context, index) {
                          StockData indexGroup=watchList.selectedIndex==0?value.stockData.where((element) => element.ind?.contains('KMI')??false,).toList()[index]:
                              watchList.selectedIndex==1?value.stockData.where((element) => element.sn==value.selectedValue,).toList()[index]:
                              watchList.selectedIndex==2?value.stockData.where((element) => element.sn==value.selectedValue,).toList()[index]:value.stockData[index];
                          return StockRow(width: width,
                              symbol: indexGroup.sym??'',
                              volume: indexGroup.v?.toDouble()??0.0,
                              lowPrice: indexGroup.lp.toString(),
                              highPrice: indexGroup.hp.toString(),
                              closePrice: indexGroup.cl?.toDouble()??0.0,
                              change: indexGroup.ch?.toDouble()??0.0,
                              changePercentage: indexGroup.chp?.toDouble()??0.0);
                        },
                      )*/
                    ],
                  );
                },

              ),
            );
          }
        );
      },
    );
  }
}
