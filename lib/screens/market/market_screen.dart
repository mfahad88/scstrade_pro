import 'package:flutter/material.dart';
import 'package:scstrade_pro/screens/market/tabs/announcement_screen.dart';
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
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            bottom: TabBar(
              isScrollable: true,
              dividerHeight: 1.0,
              dividerColor: Colors.grey.shade400,
              physics: const BouncingScrollPhysics(),
              unselectedLabelColor: Colors.black87,
              indicatorColor: Colors.blue.shade400,
              labelColor: Colors.blue.shade400,
              labelStyle: const TextStyle(
                fontSize: 14,
                letterSpacing: 1.0
              ),
                labelPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.012),
                tabs: const [
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
                AnnouncementScreen()
              ]
          )
        ),
      ),
    );
  }
}
