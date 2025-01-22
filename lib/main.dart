import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/models/response/api_response.dart';
import 'package:scstrade_pro/services/api_client.dart';
import 'package:scstrade_pro/theme/theme.dart';
import 'package:scstrade_pro/viewmodels/alldata_viewmodel.dart';
import 'package:scstrade_pro/viewmodels/company_viewmodel.dart';
import 'package:scstrade_pro/viewmodels/home_viewmodel.dart';
import 'package:scstrade_pro/viewmodels/indices_viewmodel.dart';
import 'package:scstrade_pro/viewmodels/login_viewmodel.dart';
import 'package:scstrade_pro/viewmodels/main_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scstrade_pro/views/screens/login_screen.dart';




void main() async {
  // runApp(MyApp());
/*  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCiaZmvExqmK7SLexwtkCoF4mVjm8GoDHI',
        appId: '1:340217773345:android:cab967fd3e66485dfb5260',
        messagingSenderId: '340217773345',
        projectId: 'scstradepro',
      )
  );*/
  Provider.debugCheckInvalidValueType=null;
  final _apiClient=ApiClient();

  final _loginViewModel=LoginViewModel(_apiClient);


  final _allDataViewModel=AlldataViewmodel(_apiClient);

  final _indicesViewModel=IndicesViewModel(_apiClient);
  final _companyViewModel=CompanyViewModel(_apiClient);
  final _mainViewModel=MainViewModel(_apiClient);
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => _loginViewModel,),
            ChangeNotifierProvider(create: (context) => _mainViewModel,),
            ChangeNotifierProvider(create: (context) => _allDataViewModel,),
            ChangeNotifierProvider(create: (context) => _indicesViewModel,),
            ChangeNotifierProvider(create: (context) => _companyViewModel,),
            ChangeNotifierProvider(create: (context) => HomeViewModel(alldataViewmodel: _allDataViewModel, indicesViewModel: _indicesViewModel),)
          /*  ChangeNotifierProxyProvider2<AlldataViewmodel,IndicesViewModel,HomeViewModel?>(
                create: (context) => HomeViewModel(
                    alldataViewmodel: _allDataViewModel,
                    indicesViewModel: _indicesViewModel),
                update:(context, value, value2, previous) {
                  print(DateTime.now());
                  return previous?..fetchIndices();
                }
            )*/

          ],
          child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    Size size=MediaQuery.of(context).size;
    // Use with Google Fonts package to use downloadable fonts


    return ScreenUtilInit(
      designSize: size,
      builder: (_, child) {
        TextTheme textTheme = Utils.createTextTheme(context, "Inter", "Inter");

        MaterialTheme theme = MaterialTheme(textTheme);
        return MaterialApp(
          theme: Utils.isDark(context)?theme.dark():theme.light(),

          themeMode: ThemeMode.system,
          home: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                toolbarHeight: 70.r,
                flexibleSpace: Container(
                  decoration:  BoxDecoration(
                      borderRadius:BorderRadius.only(
                          bottomLeft: Radius.circular(26.r),
                          bottomRight: Radius.circular(26.r)
                      ),
                      image: DecorationImage(
                        image: AssetImage('images/toolbar.png',),
                        fit: BoxFit.cover,
                      )
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 40.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Register An Account',
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            height: 1.0,
                            letterSpacing: -0.84,
                          ),
                        ),
                        Text(
                          'Create wealth and create a better future ',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            letterSpacing: -0.54,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                actions: <Widget>[
                  Container(),
                ]

            ),
            body: const LoginScreen(),
          ),
        );
      },

    );
  }


}



