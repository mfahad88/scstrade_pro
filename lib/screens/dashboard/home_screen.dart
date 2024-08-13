import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';
import 'package:scstrade_pro/screens/dashboard/my_wishlist_screen.dart';
import 'package:scstrade_pro/screens/myportfolio/company_portfolio_screen.dart';
import 'package:scstrade_pro/widgets/heading_with_arrow.dart';
import 'package:scstrade_pro/widgets/horizontal_list_card.dart';
import 'package:scstrade_pro/widgets/my_stock_grid.dart';

import '../../models/mock_data.dart';
import 'notification_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=context.read();
    List<String> item=<String>["KSE100","KSE30","ALLSHR"];
    final List<CandleData> _data = MockDataTesla.candles;
    return Expanded(
      child: ShaderMask(
        shaderCallback: (Rect rect) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ Colors.transparent, Utils.isDark(context)?const Color(0xFF1F222A):Colors.white],
            //set stops as par your requirement
            stops: const [0.95, 1.0], // 50% transparent, 50% white
          ).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 10),
          physics: const ScrollPhysics(),
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  Image(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    image:  const AssetImage(
                        'images/frame.png'),
                    fit: BoxFit.fill,
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 40,right: 30),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(right: 20),
                                child: const Icon(Icons.favorite_border_outlined,color: Colors.white)),
                            IconButton(onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => const NotificationScreen(),)),
                                icon: const Icon(Icons.notifications_none_outlined,color: Colors.white))
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text('\$229,375.25',style: themeController.themeData.textTheme.headlineLarge!.copyWith(
                            color: Colors.white,
                            fontSize: 48
                        ),
                        ),
                      ),
                      Container(
                        child: Text('Balance Available',style: themeController.themeData.textTheme.bodyMedium!.copyWith(
                            color: Colors.white
                        ),),
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                child: Card(
                  color: Utils.isDark(context)?const Color(0xFF1F222A):Colors.white,
                  elevation: 5.0,
                  clipBehavior: Clip.antiAlias,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width:120,
                              child: DropdownButton(items: const [
                                DropdownMenuItem<String>(value: "KSE100", child: Text("KSE100")),
                                DropdownMenuItem<String>(value: "KSE100", child: Text("KSE30")),
                                DropdownMenuItem<String>(value: "KSE100", child: Text("KSE100"))
                              ], onChanged: (value) => null,
                                isExpanded: true,
                              ),
                            ),
                            Text("78,733.13",style: themeController.themeData.textTheme.headlineLarge!.copyWith(
                              fontSize: 18,
                            ),
                              textAlign: TextAlign.end,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("L: 78,259.51 -310.07 (-0.40%)",style: themeController.themeData.textTheme.bodySmall!.copyWith(
                                  color: Colors.red,
                                  fontSize: 10
                              ),),
                              Text("H: 78,886.51 +316.07 (+0.40%)",style: themeController.themeData.textTheme.bodySmall!.copyWith(
                                fontSize: 10,
                              ),
                                textAlign: TextAlign.end,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          child: InteractiveChart(
                            candles: _data,

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: 140,
                  child: HorizontalListCard(width:120,height:140,list: Utils.getStocks(6))
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 7),
                child: HeadingWithArrow(title: "My wishlist", onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyWishlistScreen()));
                },),
              ),
              SizedBox(
                height: 160,
                child: HorizontalListCard(width:155,height:160,list: Utils.getStocks(7)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 7),
                child: HeadingWithArrow(title: "My Stocks", onPressed: () {

                },),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MyStockGrid(list: Utils.getStocks(6),onTap: (p0) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CompanyPortfolioScreen(title: p0,)));
                },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }



}
