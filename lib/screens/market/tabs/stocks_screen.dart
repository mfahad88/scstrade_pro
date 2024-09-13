import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scstrade_pro/widgets/stock_list.dart';


class StocksScreen extends StatelessWidget {
  const StocksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StockList();
  }
}
