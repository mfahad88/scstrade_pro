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
            ListenableProvider(create: (context) => StockProvider(),),
            ListenableProvider(create: (context) => HomeProvider(),),
            ListenableProvider(create: (context) => DashboardProvider(),),

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
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      home: Scaffold(
        body: SafeArea(child: HomeScreen()),
      ),
    );
  }

  @override
  void initState() {
    context.read<StockProvider>().fetchStocks();
    _timer=Timer.periodic(const Duration(seconds: 5), (timer) {
      context.read<StockProvider>().fetchStocks();
    },);
    super.initState();


  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();


  }
}


