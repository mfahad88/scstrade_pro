
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/dashboard_provider.dart';
import 'package:scstrade_pro/provider/home_provider.dart';
import 'package:scstrade_pro/provider/stock_provider.dart';
import 'package:scstrade_pro/screens/home/home_screen.dart';
import 'package:scstrade_pro/widgets/stock_list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.

  // Get a specific camera from the list of available cameras.

  /*runApp(MultiProvider(providers: [],
      child: MyApp()
  )
  );*/
  runApp(
      MultiProvider(
          providers: [
            ListenableProvider(create: (context) => StockProvider(),),
            ListenableProvider(create: (context) => HomeProvider(),),
            ListenableProvider(create: (context) => DashboardProvider(),),

          ],
          child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});





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
}

