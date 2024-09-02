import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/widgets/stock_blue_text.dart';
import 'package:scstrade_pro/widgets/stock_list.dart';
import 'package:scstrade_pro/widgets/stock_row_detail_text.dart';

import '../../../provider/dashboard_provider.dart';

class StocksScreen extends StatelessWidget {
  const StocksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DashboardProvider>().fetchStocks();
    return Consumer<DashboardProvider>(builder: (context, provider, child) {
      return provider.isLoading ? Center(child: CircularProgressIndicator(),):StockList(list: provider.stocks);
    },);
  }
}
