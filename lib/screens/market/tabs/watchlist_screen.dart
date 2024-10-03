import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/data/dto/Stock_data.dart';
import 'package:scstrade_pro/provider/stock_provider.dart';
import 'package:scstrade_pro/widgets/stock_list.dart';


class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {




  @override
  Widget build(BuildContext context) {
  StockProvider stockProvider = Provider.of(context,listen: true);

    // _timer=Timer.periodic(const Duration(seconds: 7), (timer) =>  stockProvider.fetchWatchList());
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20,),
        Selector<StockProvider,bool>(builder: (context, value, child) => value==true?StockList(list: stockProvider.stocks,screenName: "WatchList",):const Center(child: Text('No record found')) , selector: (p0, p1) => p1.stocks.any((element) => element!.isWatchList),)


      ],
    );
  }


}
