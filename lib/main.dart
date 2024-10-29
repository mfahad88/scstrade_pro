import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/announcement_provider.dart';
import 'package:scstrade_pro/provider/dashboard_provider.dart';
import 'package:scstrade_pro/provider/home_provider.dart';
import 'package:scstrade_pro/provider/stock_provider.dart';
import 'package:scstrade_pro/screens/home/home_screen.dart';
import 'package:scstrade_pro/screens/intro/ui/intro_one.dart';
import 'package:scstrade_pro/screens/intro/ui/intro_screen.dart';
import 'package:scstrade_pro/screens/intro/viewmodel/intro_viewmodel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => IntroViewModel(),),
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
          cardTheme: CardTheme(
            color: Colors.white,
            shape: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFA5A5A5),
                width: 2.0
              ),
                borderRadius: BorderRadius.circular(14.0)
            ),
          )

      ),
      darkTheme: ThemeData(
        cardTheme: CardTheme(
          color: Colors.black,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
        )
      ),
      home: Scaffold(

        body: SafeArea(
            child: IntroScreen()
        ),
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


