import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/models/data/stock_card_data.dart';
import 'package:scstrade_pro/viewmodels/company_viewmodel.dart';
import 'package:scstrade_pro/views/screens/snapshot/overview_screen.dart';
import 'package:scstrade_pro/views/widgets/m_market_status.dart';
import 'package:scstrade_pro/views/widgets/m_tab_bar.dart';

import '../../../theme/theme.dart';

class CompanySnapshotScreen extends StatefulWidget  {
  final StockCardData stockCardData;
  const CompanySnapshotScreen({super.key, required this.stockCardData});

  @override
  State<CompanySnapshotScreen> createState() => _CompanySnapshotScreenState();
}

class _CompanySnapshotScreenState extends State<CompanySnapshotScreen> with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {

    CompanyViewModel viewModel=context.read();
    _controller=TabController(length: viewModel.header.length, vsync: this);
    super.initState();
  }
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
                          widget.stockCardData.symbol??'',
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
        body: Consumer<CompanyViewModel>(
            builder: (_,value,child) {
              return Container(
                color: Utils.isDark(context)?Colors.black:Colors.white,

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
                   mTabbar(controller: _controller, tabs: value.header,onTap: (v) => value.currentIndex=v,),
                    Container(
                        child: value.currentIndex==0?OverviewScreen(context:context,stockCardData:widget.stockCardData):Text('No screen found'),
                      padding: EdgeInsets.symmetric(vertical: 15.r,horizontal: 10.r),
                    )
                    /*IndexedStack(
                      index: value.currentIndex,
                      children: value.header.map((e) => e.toLowerCase()=='overview'?OverviewScreen():Text(e.toString()),).toList(),
                    )*/
                  ],
                ),
              );
            }
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

