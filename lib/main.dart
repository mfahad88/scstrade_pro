import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedulers/schedulers.dart';
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


