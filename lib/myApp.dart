
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/data/api_service.dart';
import 'package:scstrade_pro/provider/dashboard_viewmodel.dart';
import 'package:scstrade_pro/provider/signin_viewmodel.dart';
import 'package:scstrade_pro/screens/onboard/onboard.dart';

import 'provider/signup_controller.dart';
import 'provider/theme_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.

  // Get a specific camera from the list of available cameras.

  runApp(MultiProvider(providers: [
    ListenableProvider<SigninViewmodel>(create: (context) => SigninViewmodel(),),
    ListenableProvider<SignupController>(create: (context) => SignupController()),
    ListenableProvider<ThemeController>(create: (context) => ThemeController()),
    ListenableProvider<DashboardViewmodel>(create: (context) => DashboardViewmodel(ApiService()))
  ],
    child: MyApp()
  )/* DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp()),
  )*/
  );

}

class MyApp extends StatelessWidget {
  MyApp({super.key});





  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (BuildContext context, ThemeController value, Widget? child) {
        return  MaterialApp(
            // useInheritedMediaQuery: true,
            // locale: DevicePreview.locale(context),
            // builder: DevicePreview.appBuilder,
            theme:value.themeData,
            home: const Onboard(),
        );
      },

    );
  }
}

