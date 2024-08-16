import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/provider/dashboard_viewmodel.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';
import 'package:scstrade_pro/screens/dashboard/my_wishlist_screen.dart';
import 'package:scstrade_pro/screens/myportfolio/company_portfolio_screen.dart';
import 'package:scstrade_pro/widgets/chart_type_selection.dart';
import 'package:scstrade_pro/widgets/custom_line_chart.dart';
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
    DashboardViewmodel viewmodel=context.read();
    final List<CandleData> _data = MockDataTesla.candles;
    return FutureBuilder(future: viewmodel.futureKseIndex(), builder: (context, snapshot) {
      if(snapshot.connectionState==ConnectionState.waiting){

        return const Expanded(child: Center(child: CircularProgressIndicator(),));
      }else{
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Stack(
                    children: [
                      Image(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.25,
                        image: const AssetImage(
                            'images/frame.png'),
                        fit: BoxFit.fill,
                      ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 40, right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    child: const Icon(
                                        Icons.favorite_border_outlined,
                                        color: Colors.white)),
                                IconButton(onPressed: () =>
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (
                                          context) => const NotificationScreen(),)),
                                    icon: const Icon(
                                        Icons.notifications_none_outlined,
                                        color: Colors.white))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('KSE 100: ',
                                  style: themeController.themeData.textTheme
                                      .headlineLarge!.copyWith(
                                      color: Colors.white,
                                      fontSize: 22
                                  ),
                                ),
                                Text('78,242.49 ',
                                  style: themeController.themeData.textTheme
                                      .headlineLarge!.copyWith(
                                      color: Colors.white,
                                      fontSize: 22
                                  ),
                                ),
                                Text('+140.11',
                                  style: themeController.themeData.textTheme
                                      .headlineLarge!.copyWith(
                                      color: Colors.white,
                                      fontSize: 22
                                  ),
                                ),
                                Text('(+017%)',
                                  style: themeController.themeData.textTheme
                                      .headlineLarge!.copyWith(
                                      color: Colors.white,
                                      fontSize: 22
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('M.Vol: ',
                                  style: themeController.themeData.textTheme
                                      .bodyMedium!.copyWith(
                                      color: Colors.white
                                  )
                              ),
                              Text('88.941m | ',
                                  style: themeController.themeData.textTheme
                                      .bodyMedium!.copyWith(
                                      color: Colors.white
                                  )
                              ),
                              Text('Open',
                                  style: themeController.themeData.textTheme
                                      .bodyMedium!.copyWith(
                                      color: Colors.white
                                  )
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 20),
                    child: Consumer<DashboardViewmodel>(builder: (context, viewModel, child) {
                      return Card(
                        color: Utils.isDark(context)
                            ? const Color(0xFF1F222A)
                            : Colors.white,
                        elevation: 5.0,
                        clipBehavior: Clip.antiAlias,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  DropdownButton(
                                      items: snapshot.data?.map((e) =>
                                          DropdownMenuItem(value: e.indexCode,child: Text(e.indexCode))).toList(), onChanged: (String? value) {
                                    viewModel.dropdownSelected=value!;
                                  },
                                      value: viewModel.dropdownSelected
                                  ),
                                  Text(snapshot.data!.where((element) => element.indexCode==viewModel.dropdownSelected).toList().first.currentIndex,
                                    style: themeController.themeData.textTheme
                                        .headlineLarge!.copyWith(
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(snapshot.data!.where((element) => element.indexCode==viewModel.dropdownSelected).toList().first.lowIndex,
                                      style: themeController.themeData.textTheme
                                          .bodySmall!.copyWith(
                                          color: Colors.red,
                                          fontSize: 10
                                      ),),
                                    Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                    ),
                                    Text(snapshot.data!.where((element) => element.indexCode==viewModel.dropdownSelected).toList().first.highIndex,
                                      style: themeController.themeData.textTheme
                                          .bodySmall!.copyWith(
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.end,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 300,
                                child: Consumer<DashboardViewmodel>(
                                  builder: (context, value, child) {
                                    if (value.lineSelected) {
                                      return const CustomLineChart();
                                    } else {
                                      return InteractiveChart(candles: _data);
                                    }
                                  },
                                ),
                              ),

                            ],
                          ),
                        ),
                      );
                    },),
                  ),
                  SizedBox(
                    height: 30,
                    child: Consumer<DashboardViewmodel>(

                      builder: (BuildContext context,
                          DashboardViewmodel viewmodel, Widget? child) {
                        return ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: ChartTypeSelection(
                                onTap: () {
                                  viewmodel.lineSelected = true;
                                  viewmodel.candleSelected = false;
                                },
                                isSelected: viewmodel.lineSelected,
                                title: "Line",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: ChartTypeSelection(
                                onTap: () {
                                  viewmodel.lineSelected = false;
                                  viewmodel.candleSelected = true;
                                },
                                isSelected: viewmodel.candleSelected,
                                title: "Candle",
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: ChartTypeSelection(
                                onTap: () {
                                  viewmodel.isOnemin = true;
                                  viewmodel.isFivemin = false;
                                  viewmodel.isFifteenmin = false;
                                  viewmodel.isThirtymin = false;
                                  viewmodel.isOnehour = false;
                                },
                                isSelected: viewmodel.isOnemin,
                                title: "1min",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: ChartTypeSelection(
                                onTap: () {
                                  viewmodel.isOnemin = false;
                                  viewmodel.isFivemin = true;
                                  viewmodel.isFifteenmin = false;
                                  viewmodel.isThirtymin = false;
                                  viewmodel.isOnehour = false;
                                },
                                isSelected: viewmodel.isFivemin,
                                title: "5min",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: ChartTypeSelection(
                                onTap: () {
                                  viewmodel.isOnemin = false;
                                  viewmodel.isFivemin = false;
                                  viewmodel.isFifteenmin = true;
                                  viewmodel.isThirtymin = false;
                                  viewmodel.isOnehour = false;
                                },
                                isSelected: viewmodel.isFifteenmin,
                                title: "15min",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: ChartTypeSelection(
                                onTap: () {
                                  viewmodel.isOnemin = false;
                                  viewmodel.isFivemin = false;
                                  viewmodel.isFifteenmin = false;
                                  viewmodel.isThirtymin = true;
                                  viewmodel.isOnehour = false;
                                },
                                isSelected: viewmodel.isThirtymin,
                                title: "30min",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: ChartTypeSelection(
                                onTap: () {
                                  viewmodel.isOnemin = false;
                                  viewmodel.isFivemin = false;
                                  viewmodel.isFifteenmin = false;
                                  viewmodel.isThirtymin = false;
                                  viewmodel.isOnehour = true;
                                },
                                isSelected: viewmodel.isOnehour,
                                title: "1hr",
                              ),
                            )
                          ],
                        );
                      },

                    ),
                  ),
                  SizedBox(
                      height: 140,
                      child: HorizontalListCard(
                          width: 120, height: 140, list: Utils.getStocks(6))
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 7),
                    child: HeadingWithArrow(
                      title: "My wishlist", onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const MyWishlistScreen()));
                    },),
                  ),
                  SizedBox(
                    height: 160,
                    child: HorizontalListCard(
                        width: 155, height: 160, list: Utils.getStocks(7)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 7),
                    child: HeadingWithArrow(title: "My Stocks", onPressed: () {

                    },),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MyStockGrid(list: Utils.getStocks(6), onTap: (p0) {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              CompanyPortfolioScreen(title: p0,)));
                    },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    },);

  }



}
