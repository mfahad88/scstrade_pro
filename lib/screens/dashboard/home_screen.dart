import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';
import 'package:scstrade_pro/screens/dashboard/my_wishlist_screen.dart';
import 'package:scstrade_pro/widgets/heading_with_arrow.dart';
import 'package:scstrade_pro/widgets/horizontal_list_card.dart';
import 'package:scstrade_pro/widgets/my_stock_grid.dart';

import '../../models/mock_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=context.read();
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
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                child: Card(
                  color: Utils.isDark(context)?const Color(0xFF1F222A):Colors.white,
                  elevation: 5.0,
                  clipBehavior: Clip.antiAlias,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                    child: SizedBox(
                      height: 300,
                      child: InteractiveChart(
                        candles: _data,

                      ),
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
                  child: MyStockGrid(list: Utils.getStocks(6)))
            ],
          ),
        ),
      ),
    );
  }



}
