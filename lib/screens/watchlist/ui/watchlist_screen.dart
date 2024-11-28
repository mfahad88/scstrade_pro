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
                        const Gap(5),
                        SingleChildScrollView(
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(5, (index) {
                              return Padding(
                                padding: EdgeInsets.only(right: width*0.01),
                                child: FilledButton(onPressed: () => watchList.selectedIndex=index,
                                  style: FilledButton.styleFrom(
                                    backgroundColor:  index==watchList.selectedIndex?const Color(0xFF48C0E0):const Color(0xFFF5F5F5),
                                    foregroundColor: index==watchList.selectedIndex?Colors.white:const Color(0xFF3A3A3A),
                                  ),
                                  child: Text(index==0?'Shahriah':index==1?'Future':index==2?'Sector':index==3?'ETF':'Cap'),
                                ),
                              );
                            },
                            ),
                          ),
                        ),
                        const Gap(5),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width*0.01),
                          child: Row(
                            children: [
                              Container(
                                decoration: ShapeDecoration(
                                    color: const Color(0xFFF5F5F5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: const BorderSide(
                                        width: 1,
                                        strokeAlign: BorderSide.strokeAlignCenter,
                                        color: Color(0xFFE1E1E1),
                                      )
                                )
                                ),
                                width: width*0.45,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    child: DropIndex(value: value.selectedIndices, items: value.indices, onChanged: (v) => value.selectedIndices=v,
                                    isExpanded: true,),
                                  )
                              ),
                              const Gap(7),
                              Container(
                                  decoration: ShapeDecoration(
                                      color: const Color(0xFFF5F5F5),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          side: const BorderSide(
                                            width: 1,
                                            strokeAlign: BorderSide.strokeAlignCenter,
                                            color: Color(0xFFE1E1E1),
                                          )
                                      )
                                  ),
                                  width: width*0.45,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    child: DropIndex(value: value.selectedSortBy, items: value.sortBy, onChanged: (v) => value.selectedSortBy=v,
                                    isExpanded: true,),
                                  )
                              )
                            ],
                          ),
                        ),
                        const Gap(12),
                        TitleListview(width: width,
                            indexGroups: value.selectedIndices!=value.indices.first?
                            (value.stockData
                                .where((element) => element.ind?.contains(value.selectedIndices)??false,)
                                .toList()
                              ..sort((a, b) {
                                if(value.selectedSortBy==value.sortBy[0]){
                                  return b.sym!.compareTo(a.sym!);
                                }else if(value.selectedSortBy==value.sortBy[1]){
                                  return b.v!.compareTo(a.v!);
                                }else if(value.selectedSortBy==value.sortBy[2]){
                                  return a.v!.compareTo(b.v!);
                                }else if(value.selectedSortBy==value.sortBy[3]){
                                  return b.hp!.compareTo(a.hp!);
                                }else if(value.selectedSortBy==value.sortBy[4]){
                                  return a.lp!.compareTo(b.lp!);
                                }else{
                                  return b.nm!.compareTo(a.nm!);
                                }
                              },
                              )
                            ) :(value.stockData..sort((a, b) {
                              if(value.selectedSortBy==value.sortBy[0]){
                                return b.sym!.compareTo(a.sym!);
                              }else if(value.selectedSortBy==value.sortBy[1]){
                                return b.v!.compareTo(a.v!);
                              }else if(value.selectedSortBy==value.sortBy[2]){
                                return a.v!.compareTo(b.v!);
                              }else if(value.selectedSortBy==value.sortBy[3]){
                                return b.hp!.compareTo(a.hp!);
                              }else if(value.selectedSortBy==value.sortBy[4]){
                                return a.lp!.compareTo(b.lp!);
                              }else{
                                return b.nm!.compareTo(a.nm!);
                              }
                            }))
                        )
                        /*Visibility(
                        visible: watchList.selectedIndex==2?true:false,
                          child: DropIndex(
                            value: value.selectedValue,
                            isExpanded: true,
                            items: value.stockData.map((e) => e.sn,).toSet().toList(), onChanged: (v) {
                            value.selectedValue=v;
                          },
                          )
                      ),
                     TitleListview(width: width,
                       indexGroups: watchList.selectedIndex==0?value.stockData.where((element) => element.ind?.contains('KMI')??false,).toList():watchList.selectedIndex==1?
                     value.stockData.where((element) => element.sym?.contains('-')??false,).toList() :watchList.selectedIndex==2?
                     value.stockData.where((element) => element.sn==value.selectedValue,).toList() :value.stockData,)*/
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
