
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/signin_viewmodel.dart';
import 'package:scstrade_pro/screens/onboard/onboard.dart';

import 'provider/signup_controller.dart';
import 'provider/theme_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.

  runApp(MultiProvider(providers: [
    ListenableProvider<SigninViewmodel>(create: (context) => SigninViewmodel(),),
    ListenableProvider<SignupController>(create: (context) => SignupController()),
    ListenableProvider<ThemeController>(create: (context) => ThemeController()),
  ],
    child: MyApp(cameras)
  )/* DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp()),
  )*/
  );

}

class MyApp extends StatelessWidget {
  List<CameraDescription> cameras;
  MyApp(this.cameras, {super.key});





  @override
  Widget build(BuildContext context) {
    ThemeController controller =context.read();
    controller.camera.addAll(cameras);
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

