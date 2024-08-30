import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/home_provider.dart';
import 'package:scstrade_pro/screens/market/market_screen.dart';
import 'package:scstrade_pro/screens/more/more_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
      return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,

            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Market',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Fundamental',
              ),
              BottomNavigationBarItem(

                icon: Icon(Icons.school),
                label: 'Technicals',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz),
                label: 'More',
              ),
            ],
            currentIndex: homeProvider.selectedIndex,
            selectedItemColor: Colors.green.shade700,
            onTap: (value) {
              print('value: $value');
              homeProvider.selectedIndex = value;
            },
          ),
          body: Container(
            child: Builder(builder: (context) {
              if(homeProvider.selectedIndex == 0){
                return const MarketScreen();
              }else if(homeProvider.selectedIndex == 3){
                return const MoreScreen();
              }else{
                return const Text("This screen is under development");
              }
            },),
          )
      );
    },);
  }
}
