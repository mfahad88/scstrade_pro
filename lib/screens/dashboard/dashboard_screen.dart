import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/provider/dashboard_viewmodel.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';
import 'package:scstrade_pro/screens/dashboard/home_screen.dart';
import 'package:scstrade_pro/screens/dashboard/notification_screen.dart';
import 'package:scstrade_pro/screens/myportfolio/portfolio_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = context.read();
    DashboardViewmodel dashboardViewmodel = context.read();
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Utils.isDark(context)?const Color(0xFF1F222A):Colors.white,
      body: Column(
        children: [

          Consumer<DashboardViewmodel>(builder: (context, value, child) {
            if(value.selectedIndex==0){
              return const HomeScreen();
            }else if(value.selectedIndex==1){
              return const PortfolioScreen();
            }
            return const Text("data");
          },)

        ],
      ),
      bottomNavigationBar: Consumer<DashboardViewmodel>(builder: (context, viewModel, child) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Utils.isDark(context)?const Color(0xFF1F222A):Colors.white,
          selectedItemColor: const Color(0xFF12D18E),
          unselectedItemColor: const Color(0xFF9E9E9E),
          showUnselectedLabels: true,
          currentIndex: viewModel.selectedIndex,
          items: [
            BottomNavigationBarItem(icon: Image.asset('images/home.png', color: const Color(0xFF9E9E9E)),activeIcon: Image.asset('images/home.png', color: const Color(0xFF12D18E)), label: 'Home'),
            BottomNavigationBarItem(icon:  Image.asset('images/portfolio.png',color: const Color(0xFF9E9E9E)), label: 'Portfolio',activeIcon: Image.asset('images/portfolio.png',color: const Color(0xFF12D18E))),
            BottomNavigationBarItem(icon:  Image.asset('images/discovery.png',color: const Color(0xFF9E9E9E)), label: 'Discover', activeIcon: Image.asset('images/discovery.png',color: const Color(0xFF12D18E))),
            BottomNavigationBarItem(icon:  Image.asset('images/more.png',color: const Color(0xFF9E9E9E)), label: 'More', activeIcon: Image.asset('images/more.png',color: const Color(0xFF12D18E))),
            BottomNavigationBarItem(icon:  Image.asset('images/account.png',color: const Color(0xFF9E9E9E)), label: 'Account', activeIcon: Image.asset('images/account.png',color: const Color(0xFF12D18E)))
          ],
          onTap: (value) =>
          viewModel.selectedIndex = value,
        );
      },),
    );
  }
}
