import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/models/response/api_response.dart';
import 'package:scstrade_pro/models/todos/Todos.dart';
import 'package:scstrade_pro/repositories/alldata_repository.dart';
import 'package:scstrade_pro/repositories/company_repository.dart';
import 'package:scstrade_pro/repositories/indices_repository.dart';
import 'package:scstrade_pro/repositories/login_repository.dart';
import 'package:scstrade_pro/repositories/todo_repository.dart';
import 'package:scstrade_pro/services/api_client.dart';
import 'package:scstrade_pro/theme/theme.dart';
import 'package:scstrade_pro/viewmodels/alldata_viewmodel.dart';
import 'package:scstrade_pro/viewmodels/company_viewmodel.dart';
import 'package:scstrade_pro/viewmodels/indices_viewmodel.dart';
import 'package:scstrade_pro/viewmodels/login_viewmodel.dart';
import 'package:scstrade_pro/viewmodels/main_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scstrade_pro/views/screens/login_screen.dart';


import 'theme/app_theme.dart';
import 'models/todos/Todo.dart';



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
  final _apiClient=ApiClient();
  final _loginRepository=LoginRepository(_apiClient);
  final _loginViewModel=LoginViewModel(loginRepository: _loginRepository);
  final _mainViewModel=MainViewModel();
  final _allDataRepository=AllDataRepository(_apiClient);
  final _allDataViewModel=AlldataViewmodel(_allDataRepository);
  final _indicesRepository=IndicesRepository(_apiClient);
  final _indicesViewModel=IndicesViewModel(_indicesRepository);
  final _companyViewModel=CompanyViewModel(CompanyRepository(_apiClient));
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => _loginViewModel,),
            ChangeNotifierProvider(create: (context) => _mainViewModel,),
            ChangeNotifierProvider(create: (context) => _allDataViewModel,),
            ChangeNotifierProvider(create: (context) => _indicesViewModel,),
            ChangeNotifierProvider(create: (context) => _companyViewModel,)
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



