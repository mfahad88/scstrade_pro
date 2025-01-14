import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/theme/theme.dart';
import 'package:scstrade_pro/viewmodels/indices_viewmodel.dart';
import 'package:scstrade_pro/viewmodels/main_viewmodel.dart';
import 'package:scstrade_pro/views/screens/home_screen.dart';
import 'package:scstrade_pro/views/screens/indices_screen.dart';
import 'package:scstrade_pro/views/screens/stock_index_screen.dart';

import '../widgets/m_bottombar.dart';
import '../widgets/m_market_status.dart';

class MainScreen extends StatelessWidget {
  final BuildContext context;
  const MainScreen({super.key, required this.context});

  @override
  Widget build(BuildContext _) {
    Size size=MediaQuery.of(context).size;
    MainViewModel viewModel=context.read();
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
              margin: EdgeInsets.only(left: 30.r,top: 40.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                Image.asset('images/scs_logo.png',
                    fit: BoxFit.contain,
                    width: 44.r,
                    height: 29.r),
                  Gap(8.r),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('SCS Trade Pro',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 18.r,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1.0

                        ),
                      ),
                      Gap(2.0.r),
                      Text(
                        'Committed to intelligent investing',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(

                          color: Colors.white,
                          fontSize: 8.5.r,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.22,
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
        endDrawer: Drawer(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: ShapeDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(Utils.isDark(context)?'images/sidebar_dark.png':'images/sidebar_light.png')
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.0)
                )
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10.r,right: 10.r,bottom: 30.r,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 59.r,left: 27.r),
                    width: 35.r,
                    height: 35.r,
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: MaterialTheme.lightScheme().inverseOnSurface
                    ),
                    child: Icon(Icons.close),
                  ),
                  Gap(34.r),
                  Expanded(
                    child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 30.r),
                        itemBuilder: (context, index) => ListTile(
                          leading: Image.asset(viewModel.imageMenus[index],
                            color: Utils.isDark(context)?Colors.white:Colors.black,),
                          onTap: () {
                            if(viewModel.sideMenus[index].toLowerCase()=='indices'){
                              context.read<IndicesViewModel>().fetchIndices();
                              // viewModel.selectedMenu=viewModel.sideMenus[index];
                              Scaffold.of(context).closeEndDrawer();
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => IndicesScreen(),));
                            }else if(viewModel.sideMenus[index].toLowerCase()=='StockIndexScreen'){
                              // context.read<IndicesViewModel>().fetchByIndex(viewModel.selectedIndex);
                            }
                          },
                          title: Text(viewModel.sideMenus[index],
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Utils.isDark(context)?Colors.white:Colors.black,
                              fontWeight: FontWeight.w500,
                              height: 1.50,
                              letterSpacing: -0.32,
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) => const Divider(
                          thickness: 1,
                          color: Color(0xFFC9C6C4),
                        ),
                        itemCount: viewModel.sideMenus.length),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.r),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: const Divider(
                        thickness: 1,
                        color: Color(0xFFC9C6C4),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/scs_logo.png',
                        fit: BoxFit.contain,
                        width: 41.r,
                        height: 29.r,),
                      Gap(8.0.r),
                      Column(
                        children: [
                          Text(
                            'SCS Trade Pro',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Utils.isDark(context)?Colors.white:Color(0xFF1C1C1C),
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.52,
                            ),
                          ),
                          Text(
                            'Committed to intelligent investing',
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Utils.isDark(context)?Colors.white:Color(0xFF1C1C1C),
                              fontSize: 7.42,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.22,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        body: Consumer<MainViewModel>(
            builder: (_,value,child) {

              return Stack(

                children: [
                  Container(
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
                        value.selectedMenu=='Home'?Center(child: HomeScreen(ctx: context,)):Center(child: Text('This screen is under development')),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Builder(
                        builder: (ctx) {
                          return mBottombar(
                            size: size,
                            menus: value.menus,
                            selectedMenu: value.selectedMenu,
                            onTap: (p0) {
                              print(p0);
                              p0.toLowerCase()!='more'?value.selectedMenu=p0:Scaffold.of(ctx).openEndDrawer();
                            },
                          );
                        }
                    ),
                  )
                ],
              );
            }
        ),
      ),
    );
  }
}
