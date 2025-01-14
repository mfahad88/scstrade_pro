import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/models/indices/IndicesSummary.dart';
import 'package:scstrade_pro/models/response/api_response.dart';
import 'package:scstrade_pro/theme/theme.dart';
import 'package:scstrade_pro/viewmodels/indices_viewmodel.dart';
import 'package:scstrade_pro/viewmodels/main_viewmodel.dart';
import 'package:scstrade_pro/views/screens/stock_index_screen.dart';
import 'package:scstrade_pro/views/widgets/m_indice_card.dart';
import 'package:scstrade_pro/views/widgets/m_market_status.dart';
import 'package:scstrade_pro/views/widgets/m_rounded_container.dart';

class IndicesScreen extends StatelessWidget {
  const IndicesScreen({super.key});

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
                          'Indices',
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
        body: Consumer<IndicesViewModel>(
            builder: (_,value,child) {
              return Container(

                margin: EdgeInsets.symmetric(horizontal: 10.r),
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
                    _indicesList(context,value)
                  ],
                ),
              );
            }
        ),
      ),
    );
  }

  _indicesList(BuildContext context,IndicesViewModel value) {

    switch(value.apiResponse.status) {
      case null:

      case Status.loading:
        return const Center(child: CircularProgressIndicator(),);
      case Status.completed:
        return ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // context.read<MainViewModel>().selectedMenu='StockIndexScreen';
                  // context.read<MainViewModel>().selectedIndex= (value.apiResponse.data![index] as IndicesSummary).indexcode??'';
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => StockIndexScreen(index: (value.apiResponse.data![index] as IndicesSummary).indexcode.toString()),));
                },
                child: Container(
                  clipBehavior: Clip.none,
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.0.r,
                      vertical: 12.0.r
                  ),
                  decoration: ShapeDecoration(

                    color: Utils.isDark(context)?Color(0xFF1C1B1B):Color(0xFFFCF8F8),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Utils.isDark(context)? Color(0xFF313030):Color(0xFFF4F0EF)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: mIndicesCard(
                      context: context,
                      indicesSummary: value.apiResponse.data![index])
                      // .animate().slideY(duration: Duration(milliseconds: 800),curve: Curves.decelerate),
                ),
              );

            },
            separatorBuilder: (context, index) => Gap(10.r),
            itemCount: value.apiResponse.data?.length??0);
      case Status.error:
        return Center(child: Text(value.apiResponse.message??""));
    }

  }
}
