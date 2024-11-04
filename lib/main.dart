import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/announcement_provider.dart';
import 'package:scstrade_pro/provider/dashboard_provider.dart';
import 'package:scstrade_pro/provider/home_provider.dart';
import 'package:scstrade_pro/provider/stock_provider.dart';
import 'package:scstrade_pro/screens/dashboard/ui/dashboard_screen.dart';
import 'package:scstrade_pro/screens/home/home_screen.dart';
import 'package:scstrade_pro/screens/intro/ui/intro_one.dart';
import 'package:scstrade_pro/screens/intro/ui/intro_screen.dart';
import 'package:scstrade_pro/screens/intro/viewmodel/intro_viewmodel.dart';
import 'package:scstrade_pro/screens/login/ui/login_screen.dart';
import 'package:scstrade_pro/screens/login/viewmodel/login_viewmodel.dart';
import 'package:scstrade_pro/theme/ttheme_dark.dart';
import 'package:scstrade_pro/theme/ttheme_light.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => LoginViewModel(),),
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
      themeMode: ThemeMode.system,
      theme: ttheme_light,
      darkTheme: ttheme_dark,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: HomeScreen(),
        ),
      ),
    );
  }

  @override
  void initState() {
   /* _provider=context.read<StockProvider>();
    _provider?.fetchStocks();

    _timer=Timer.periodic(const Duration(seconds: 5), (timer) async {
      _provider?.fetchStocks();
    },);*/
    super.initState();


  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}


