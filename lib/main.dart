import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/models/response/api_response.dart';
import 'package:scstrade_pro/models/todos/Todos.dart';
import 'package:scstrade_pro/repositories/login_repository.dart';
import 'package:scstrade_pro/repositories/todo_repository.dart';
import 'package:scstrade_pro/services/api_client.dart';
import 'package:scstrade_pro/theme/theme.dart';
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
  runApp(
      MultiProvider(
          providers: [
          ChangeNotifierProvider(create: (context) => _loginViewModel,),
            ChangeNotifierProvider(create: (context) => _mainViewModel,),
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
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100.0.r),
              child: AppBar(
                flexibleSpace: Image(
                  image: AssetImage('images/toolbar.png'),
                  fit: BoxFit.fill,
                ),
                centerTitle: true,
                title: Text('Register An Account',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  ),
                ),
                bottom: PreferredSize(preferredSize: Size.fromHeight(0), child: Padding(
                  padding: EdgeInsets.only(bottom: 26.0.r),
                  child: Text('Create wealth and create a better future',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white
                    ),
                  ),
                )
                ),
              ),
            ),
            body: const LoginScreen(),
          ),
        );
      },

    );
  }
  

}



