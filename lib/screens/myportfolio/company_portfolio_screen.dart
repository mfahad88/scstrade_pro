import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';
import 'package:scstrade_pro/screens/myportfolio/overview_screen.dart';
import 'package:scstrade_pro/widgets/row_key_value.dart';

class CompanyPortfolioScreen extends StatelessWidget {
  final String? title;
  const CompanyPortfolioScreen({super.key,this.title});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=context.read();
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
            bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.grey.shade500,
              indicatorColor: Colors.greenAccent,
              labelColor: Colors.greenAccent,
              tabs: const [
                Tab(text: "Overview",),
                Tab(text: "Company Profile",),
                Tab(text: "Fundamental",),
                Tab(text: "Annual Statement",),
              ],
            ),
          ),
          body:SafeArea(
            child: TabBarView(
              children: [
                OverviewScreen(title: title,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
