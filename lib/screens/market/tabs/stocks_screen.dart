import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/stock_provider.dart';
import 'package:scstrade_pro/widgets/stock_blue_text.dart';
import 'package:scstrade_pro/widgets/stock_list.dart';
import 'package:scstrade_pro/widgets/stock_row_detail_text.dart';

import '../../../provider/dashboard_provider.dart';

class StocksScreen extends StatefulWidget {
  const StocksScreen({super.key});

  @override
  State<StocksScreen> createState() => _StocksScreenState();
}
class _StocksScreenState extends State<StocksScreen> {
  Timer? timer;
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
    timer?.cancel();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
}

