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
  @override
  Widget build(BuildContext context) {
    StockProvider provider = Provider.of(context,listen: false);
    return  MaterialApp(
      scaffoldMessengerKey: provider.snackbarKey,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: SafeArea(child: HomeScreen()),
      ),
    );
  }

  @override
  void initState() {
    context.read<StockProvider>().fetchStocks();
    _timer=Timer.periodic(const Duration(seconds: 5), (timer) async {
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


