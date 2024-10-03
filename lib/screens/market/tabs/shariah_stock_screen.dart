import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/stock_provider.dart';
import '../../../widgets/stock_list.dart';

class ShariahStockScreen extends StatelessWidget {
  const ShariahStockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StockProvider provider=Provider.of(context,listen: true);

    // provider.addSector(provider.stocks.map((e) => e.stockData.sn,).toList());
    return Column(
      children: [

        provider.stocks.isEmpty?const CircularProgressIndicator():StockList(list: provider.stocks,screenName: "Shariah",),
      ],
    );
  }
}
