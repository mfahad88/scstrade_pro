import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/dashboard/viewmodel/dashboard_viewmodel.dart';
import 'package:scstrade_pro/screens/home/viewmodel/home_viewmodel.dart';
import 'package:scstrade_pro/screens/intro/ui/intro_screen.dart';
import 'package:scstrade_pro/screens/intro/viewmodel/intro_viewmodel.dart';
import 'package:scstrade_pro/screens/login/viewmodel/login_viewmodel.dart';
import 'package:scstrade_pro/screens/viewmodel/shared_viewmodel.dart';
import 'package:scstrade_pro/screens/watchlist/viewmodel/watchlist_viewmodel.dart';
import 'package:scstrade_pro/theme/ttheme_dark.dart';
import 'package:scstrade_pro/theme/ttheme_light.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCiaZmvExqmK7SLexwtkCoF4mVjm8GoDHI',
        appId: '1:340217773345:android:cab967fd3e66485dfb5260',
        messagingSenderId: '340217773345',
        projectId: 'scstradepro',
      )
  );

  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => LoginViewModel(),),
            ChangeNotifierProvider(create: (context) => DashboardViewModel(),),
            ChangeNotifierProvider(create: (context) => SharedViewModel(),),
            // ProxyProvider<DashboardViewModel,WatchListViewModel>(update: (context, value, previous) => WatchListViewModel(value),),
            ChangeNotifierProvider(create: (context) => WatchListViewModel(),),
            ChangeNotifierProvider(create: (context) => IntroViewModel(),),
            ChangeNotifierProvider(create: (context) => HomeViewModel(),),

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

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ttheme_light,
      darkTheme: ttheme_dark,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: IntroScreen(),
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


