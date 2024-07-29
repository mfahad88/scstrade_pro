
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/controller/theme_controller.dart';
import 'package:scstrade_pro/screens/onboard/onboard.dart';
import 'package:scstrade_pro/screens/controller/signupController.dart';

void main() {

  runApp(MultiProvider(providers: [
    ListenableProvider<Signupcontroller>(create: (context) => Signupcontroller()),
    ListenableProvider<ThemeController>(create: (context) => ThemeController()),
  ],
    child: const MyApp()
  )/* DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp()),
  )*/
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (BuildContext context, ThemeController value, Widget? child) {
        return  MaterialApp(
            // useInheritedMediaQuery: true,
            // locale: DevicePreview.locale(context),
            // builder: DevicePreview.appBuilder,
            theme:value.themeData,
            home: Onboard(),
        );
      },

    );
  }
}

