import 'package:flutter/material.dart';
import 'package:scstrade_pro/screens/announcements/accouncements_screen.dart';
import 'package:scstrade_pro/screens/market/tabs/dashboard_screen.dart';
import 'package:scstrade_pro/screens/market/tabs/shariah_stock_screen.dart';
import 'package:scstrade_pro/screens/market/tabs/stocks_screen.dart';
import 'package:scstrade_pro/screens/market/tabs/watchlist_screen.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
                isScrollable: true,
                physics: BouncingScrollPhysics(),
                tabs: [
                  Tab(text: 'Dashboard',),
                  Tab(text: 'Stocks',),
                  Tab(text: 'Shariah Stock',),
                  Tab(text: 'Watchlist',),
                  Tab(text: 'Announcement',),
                ]),
          ),
          body: const TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children:[
                DashboardScreen(),
                StocksScreen(),
                ShariahStockScreen(),
                WatchlistScreen(),
                AccouncementsScreen()
              ]
          )
      ),
    );
  }
}
