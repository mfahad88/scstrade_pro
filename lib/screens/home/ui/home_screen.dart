import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/dashboard/ui/dashboard_screen.dart';
import 'package:scstrade_pro/screens/home/viewmodel/home_viewmodel.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, homeProvider, child) {
      return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFF2CE52F),
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon:Image.asset('images/watchlist.png'),
                label: 'Watchlist',
              ),
               BottomNavigationBarItem(
                icon: Image.asset('images/account.png'),
                label: 'Account',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/holdings.png'),
                label: 'Holdings',
              ),
              BottomNavigationBarItem(
                icon:Image.asset('images/logs.png'),
                label: 'Logs',
              ),
            ],
            currentIndex: homeProvider.selectedIndex,
            onTap: (value) {
              print('value: $value');
              homeProvider.selectedIndex = value;
            },
          ),
          body: Container(
            child: Builder(builder: (context) {
              if(homeProvider.selectedIndex == 0){
                return DashboardScreen();
              } else{
                return const Text("This screen is under development");
              }
            },),
          )
      );
    },);
  }
}
