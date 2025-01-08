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

class MainScreen extends StatelessWidget {
  final BuildContext context;
  const MainScreen({super.key, required this.context});

  @override
  Widget build(BuildContext _) {
    Size size=MediaQuery.of(context).size;
    MainViewModel viewModel=context.read();
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.0.r),
          child: AppBar(
            backgroundColor: Colors.black,

            flexibleSpace: Image(
              image: AssetImage('images/toolbar.png'),
              fit: BoxFit.cover,
            ),
            leading: Container(
                padding: EdgeInsets.only(left: 20.r),
                child: Image.asset('images/scs_logo.png',fit: BoxFit.contain,)),

            title: Column(
              children: [
                Text('Scs Trade Pro',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      height: 1.0

                  ),
                ),
                Text(
                  'Committed to intelligent investing',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Colors.white,
                    fontSize: 7.42,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.22,
                  ),
                )
              ],
            ),
            actions: [
              IconButton(
                visualDensity: VisualDensity(horizontal: -4.0),
                onPressed: () => print('search'), icon: Icon(Icons.search,color: Colors.white,),),
              Stack(
                children: [
                  IconButton(

                      onPressed: () => print('search'), icon: Icon(Icons.notifications_none,color: Colors.white)
                  ),
                  Positioned(
                    right: 8.r,
                    top: 8.r,
                    child: Container(
                      width: 16,
                      height: 16,
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
            ],
          ),
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
                            if(viewModel.sideMenus[index].toLowerCase()=='all stocks'){
                              context.read<IndicesViewModel>().fetchIndices();
                              viewModel.selectedMenu=viewModel.sideMenus[index];
                              Scaffold.of(context).closeEndDrawer();
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

              return SafeArea(
                child: Stack(
                  children: [
                    value.selectedMenu=='Home'?Center(child: HomeScreen(ctx: context,)):value.selectedMenu=='All Stocks'?IndicesScreen():value.selectedMenu=='StockIndexScreen'?StockIndexScreen(index:value.selectedIndex):Center(child: Text('This screen is under development')),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Builder(
                          builder: (ctx) {
                            return mBottombar(
                              size: size,
                              menus: value.menus,
                              selectedMenu: value.selectedMenu,
                              onTap: (p0) => p0.toLowerCase()!='more'?value.selectedMenu=p0:Scaffold.of(ctx).openEndDrawer(),
                            );
                          }
                      ),
                    )
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
