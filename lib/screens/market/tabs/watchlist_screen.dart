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
  Timer? _timer;




  @override
  Widget build(BuildContext context) {
    StockProvider stockProvider = Provider.of(context,listen: false);
    stockProvider.fetchWatchList();
    _timer=Timer.periodic(const Duration(seconds: 7), (timer) =>  stockProvider.fetchWatchList());
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(onPressed: () {
            stockProvider.fetchWatchList();
          }, icon: const Icon(Icons.refresh)),
        ),

        StockList(list: stockProvider.watchList,screenName: "WatchList",),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();

  }
}
