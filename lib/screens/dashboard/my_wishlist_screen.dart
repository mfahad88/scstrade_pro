import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/dashboard_viewmodel.dart';
import 'package:scstrade_pro/widgets/expandable_search.dart';

import '../../models/MyStock.dart';
import '../../widgets/my_stock_grid.dart';

class MyWishlistScreen extends StatelessWidget {
  const MyWishlistScreen({super.key});


  @override
  Widget build(BuildContext context) {
    DashboardViewmodel dashboardViewmodel=context.read();

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
          title: const Text("My Wishlist"),
          actions: [
            ExpandableSearch(onChanged: (value) {
              if(value.length>3) {
                dashboardViewmodel.list=dashboardViewmodel.list.where((element) =>element.title.toLowerCase().contains(value.toLowerCase())).toList();
              }else if(value.isEmpty){
                dashboardViewmodel.list = List.empty();
              }
            },),
            IconButton(onPressed: () {

            }, icon: const Icon(Icons.add),color: const Color(0xFF212121),)
          ],
        ),
        body: Consumer<DashboardViewmodel>(builder: (context, value, child){

          return MyStockGrid(list: value.list);
        }),
      ),
    );
  }


}
