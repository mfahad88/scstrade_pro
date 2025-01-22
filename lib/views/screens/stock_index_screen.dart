import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/models/data/stock_card_data.dart';
import 'package:scstrade_pro/models/indices/Indices.dart';
import 'package:scstrade_pro/models/indices/IndicesSummary.dart';
import 'package:scstrade_pro/models/response/api_response.dart';
import 'package:scstrade_pro/viewmodels/alldata_viewmodel.dart';
import 'package:scstrade_pro/viewmodels/indices_viewmodel.dart';
import 'package:scstrade_pro/views/widgets/m_market_status.dart';
import 'package:scstrade_pro/views/widgets/m_stock_card.dart';

import '../../models/allData/Alldata_indices.dart';
import '../../theme/theme.dart';

class StockIndexScreen extends StatelessWidget {
  final IndicesSummary indicesSummary;
  const StockIndexScreen({super.key, required this.indicesSummary});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            toolbarHeight: 70.r,
            flexibleSpace: Container(
              decoration:  BoxDecoration(
                  borderRadius:BorderRadius.only(
                      bottomLeft: Radius.circular(26.r),
                      bottomRight: Radius.circular(26.r)
                  ),
                  image: DecorationImage(
                    image: AssetImage('images/toolbar.png',),
                    fit: BoxFit.cover,
                  )
              ),
              child: Container(
                margin: EdgeInsets.only(left: 30.r,top: 35.r),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Row(

                            children: [
                              Icon(Icons.arrow_back_ios,color: Colors.white,size: 18.r,),
                              Text(
                                'Back',

                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  height: 1.50,
                                  letterSpacing: -0.32,
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          indicesSummary.indexcode?.replaceAll('Index', '')??'',
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: Colors.white,
                            fontSize: 28.r,
                            fontWeight: FontWeight.w500,
                            height: 1.19,
                            letterSpacing: -0.56,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(child: Icon(Icons.search,color: Colors.white,)),
                        Container(
                          margin: EdgeInsets.only(right: 30.r),
                          child: Stack(
                            children: [
                              IconButton(

                                  onPressed: () => print('search'), icon: Icon(Icons.notifications_none,color: Colors.white)
                              ),
                              Positioned(
                                right: 8.r,
                                top: 8.r,
                                child: Container(
                                  width: 16.r,
                                  height: 16.r,
                                  decoration: ShapeDecoration(
                                      color: MaterialTheme.lightScheme().error,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(100.r)
                                      )
                                  ),
                                  child: Text(
                                    '3',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              Container(),
            ]

        ),
        backgroundColor: Utils.isDark(context)?Colors.black:Colors.white,
        body: Consumer<AlldataViewmodel>(
          builder: (_,value,child) {
            return Container(
              color: Utils.isDark(context)?Colors.black:Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 10.r),
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.r),
                    child: mMarketStatus(),
                  ),
                  Divider(
                    color: Color(0xFFE5E2E1),
                    thickness: 1,
                    height: 1,
                  ),
                  Gap(10.r),
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
             var indices=value.fetchByIndex(indicesSummary.indexcode?.replaceAll('Index', '')??'')?[i];
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
            itemCount: value.fetchByIndex(indicesSummary.indexcode?.replaceAll('Index', '')??'')?.length??0
        );
      case Status.error:
        return Center(
          child: Text(value.apiResponse.message??""),
        );
    }
  }
}
