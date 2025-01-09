import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/models/data/stock_card_data.dart';
import 'package:scstrade_pro/models/indices/Indices.dart';
import 'package:scstrade_pro/models/response/api_response.dart';
import 'package:scstrade_pro/viewmodels/alldata_viewmodel.dart';
import 'package:scstrade_pro/viewmodels/indices_viewmodel.dart';
import 'package:scstrade_pro/views/widgets/m_market_status.dart';
import 'package:scstrade_pro/views/widgets/m_stock_card.dart';

import '../../models/allData/Alldata_indices.dart';

class StockIndexScreen extends StatelessWidget {
  final String index;
  const StockIndexScreen({super.key, required this.index});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Consumer<AlldataViewmodel>(
          builder: (_,value,child) {
            return Container(
              color: Utils.isDark(context)?Colors.black:Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15.r),
              child: ListView(
                children: [
                  mMarketStatus(),
                  Gap(5.0.r),
                  _stockList(value)
                ],
              ),
            );
          }
        ),
      ),
    );
  }

  _stockList(AlldataViewmodel value) {
    switch(value.apiResponse.status) {
      case null:

      case Status.loading:
        return Center(
            child: CircularProgressIndicator()
        );
      case Status.completed:
        return ListView.separated(
          shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
            print(index);
             var indices= value.apiResponse.data?.where((element) => index.toLowerCase().contains('all')?element.ind?.contains('\"\"')??false:element.ind?.contains(index)??false).toList()[i];
             return mStockCard(stockCardData: StockCardData(indices?.companyLogo??'', indices?.ind.toString(), indices?.sym, indices?.nm, indices?.v.toString(), indices?.cl.toString(), indices?.ch.toString(), indices?.chp.toString(), indices?.hp.toString(), indices?.lp.toString(),
                 indices?.ap.toString(), indices?.av.toString(), indices?.bp.toString(), indices?.bv.toString(), [
                   FlSpot(0, 1.5),
                   FlSpot(1, 2.5),
                   FlSpot(2, 4.5),
                   FlSpot(3, 3.5),
                   FlSpot(4, 3.5),
                 ])
             );
            },
            separatorBuilder: (context, index) => Gap(10.r),
            itemCount: value.apiResponse.data?.where((element) => element.ind?.contains(index)??false,).toList().length??0
        );
      case Status.error:
        return Center(
          child: Text(value.apiResponse.message??""),
        );
    }
  }
}
