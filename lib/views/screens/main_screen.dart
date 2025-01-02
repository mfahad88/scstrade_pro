import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/viewmodels/main_viewmodel.dart';
import 'package:scstrade_pro/views/screens/home_screen.dart';

import '../widgets/m_bottombar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
  Size size=MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: Consumer<MainViewModel>(
            builder: (_,value,child) {

              return SafeArea(
                child: Stack(
                  children: [
                    value.selectedMenu=='Home'?Center(child: HomeScreen(ctx: context,)):Center(child: Text('This screen is under development')),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: mBottombar(
                        size: size,
                        menus: value.menus,
                        selectedMenu: value.selectedMenu,
                        onTap: (p0) => value.selectedMenu=p0,
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
