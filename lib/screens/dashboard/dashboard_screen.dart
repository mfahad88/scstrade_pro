import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/dashboard_viewmodel.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';
import 'package:scstrade_pro/screens/dashboard/home_screen.dart';
import 'package:scstrade_pro/screens/dashboard/notification_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = context.read();
    DashboardViewmodel dashboardViewmodel = context.read();
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              const Image(
                image:  AssetImage(
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
          Consumer<DashboardViewmodel>(builder: (context, value, child) {
            if(value.selectedIndex==0){
              return const HomeScreen();
            }
            return const Text("data");
          },)

        ],
      ),
    bottomNavigationBar: NavigationBar(

      backgroundColor: Colors.white,

      destinations: [
      NavigationDestination(icon: Image.asset('images/home.png',color: const Color(0xFF9E9E9E)), label: 'Home'),
      NavigationDestination(icon:  Image.asset('images/portfolio.png',color: const Color(0xFF9E9E9E)), label: 'Portfolio'),
        NavigationDestination(icon:  Image.asset('images/discovery.png',color: const Color(0xFF9E9E9E)), label: 'Discover'),
        NavigationDestination(icon:  Image.asset('images/more.png',color: const Color(0xFF9E9E9E)), label: 'More'),
        NavigationDestination(icon:  Image.asset('images/account.png',color: const Color(0xFF9E9E9E)), label: 'Account')
    ],
      onDestinationSelected: (value) {
        dashboardViewmodel.selectedIndex = value;
      },
    ),
    );
  }
}
