import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scstrade_pro/widgets/stock_list.dart';


class StocksScreen extends StatefulWidget {
  const StocksScreen({super.key});

  @override
  State<StocksScreen> createState() => _StocksScreenState();
}
class _StocksScreenState extends State<StocksScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StockList();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
}

