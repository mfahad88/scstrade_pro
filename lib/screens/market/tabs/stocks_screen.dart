import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/widgets/stock_list.dart';

import '../../../provider/stock_provider.dart';
import '../../../widgets/drop_index.dart';


class StocksScreen extends StatelessWidget {
  const StocksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StockProvider provider=Provider.of(context,listen: true);
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
        StockList(list: provider.stocks!,screenName: "Stocks",),
      ],
    );
  }
}
