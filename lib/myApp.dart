
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/stock_provider.dart';
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
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      home: Scaffold(
        body: SafeArea(child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: StockList(),
        )),
      ),
    );
  }
}

