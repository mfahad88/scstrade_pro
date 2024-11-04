import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/login/ui/real_trading.dart';
import 'package:scstrade_pro/screens/login/ui/virtual_trading.dart';
import 'package:scstrade_pro/screens/login/viewmodel/login_viewmodel.dart';
import 'package:scstrade_pro/widgets/text_16.dart';

import '../../../../helper/Utils.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor:Colors.transparent,
        appBar: AppBar(
          backgroundColor:Colors.transparent,
          bottom: TabBar(
            indicatorColor: Utils.isDark(context)?Color(0xFF2CE52F):Color(0xFF0B4702),
            labelColor: Utils.isDark(context)?Color(0xFF2CE52F):Color(0xFF0B4702),
            unselectedLabelColor: Utils.isDark(context)?Colors.white:Color(0xFFC0C0CB),
            dividerColor: Colors.transparent,
            tabs: <Widget>[
              Tab(
                child: Text(
                  'Real Trading',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w600,
                    height: 0.06,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Virtual Trading',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                    height: 0.06,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          color: Utils.isDark(context)?Color(0xFF1D1D1D):Colors.white,
          child: LayoutBuilder(
            builder: (context, constraints) => Padding(
              padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth*0.033, vertical: constraints.maxWidth*0.05),
              child: TabBarView(
                children: <Widget>[
                  RealTrading(),
                  VirtualTrading(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


