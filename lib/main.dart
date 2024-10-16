import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedulers/schedulers.dart';
import 'package:scstrade_pro/provider/announcement_provider.dart';
import 'package:scstrade_pro/provider/dashboard_provider.dart';
import 'package:scstrade_pro/provider/home_provider.dart';
import 'package:scstrade_pro/provider/stock_provider.dart';
import 'package:scstrade_pro/screens/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => StockProvider(),),
            ChangeNotifierProvider(create: (context) => HomeProvider(),),
            ChangeNotifierProvider(create: (context) => DashboardProvider(),),
            ChangeNotifierProvider(create: (context) => AnnouncementProvider(),),

          ],
          child: const MyApp()
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Timer? _timer;

  StockProvider? _provider;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      scaffoldMessengerKey: _provider?.snackbarKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade100
        ),
        cardTheme: CardTheme(
          clipBehavior: Clip.none,
          color: Colors.white,
          shadowColor: Colors.white30,
          elevation: 5.0,
          surfaceTintColor: Colors.grey.shade200
        ),
        tabBarTheme:  TabBarTheme(
          dividerHeight: 1.0,
          dividerColor: Colors.grey.shade400,
          unselectedLabelColor: Colors.black87,
          indicatorColor: Colors.blue.shade400,
          labelColor: Colors.blue.shade400,
          labelStyle: const TextStyle(
              fontSize: 14,
              letterSpacing: 1.0
          ),
          labelPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.012),
        ),


        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey.shade100,
          selectedItemColor: Colors.greenAccent.shade700,
          unselectedItemColor: Colors.black87,
          elevation: 5.0
        ),


      ),
      darkTheme: ThemeData(

      ),
      home: const Scaffold(

        body: SafeArea(child: HomeScreen()),
      ),
    );
  }

  @override
  void initState() {
    _provider=context.read<StockProvider>();
    _provider?.fetchStocks();

    _timer=Timer.periodic(const Duration(seconds: 5), (timer) async {
      _provider?.fetchStocks();
    },);
    super.initState();


  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}


