import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/login/ui/widgets/card_indices.dart';
import 'package:scstrade_pro/screens/login/ui/widgets/my_tab_bar.dart';
import 'package:scstrade_pro/screens/login/viewmodel/login_viewmodel.dart';

import '../../../helper/Utils.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();


}

class _LoginScreenState extends State<LoginScreen> {
  Timer? _timer;
  LoginViewModel? viewModel;
  @override
  void initState() {


    viewModel=Provider.of(context,listen: false);
    viewModel?.fetchIndices();
    _timer=Timer.periodic(const Duration(seconds: 5), (timer) {
      viewModel?.fetchIndices();
    },);
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: Utils.isDark(context)?const AssetImage('images/bg_dark.png'):const AssetImage('images/bg_light.png'),fit: BoxFit.fill)
                )
            ),
            LayoutBuilder(
              builder: (_, constraints) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Gap(40),
                          Container(
                              margin:EdgeInsets.only(top:constraints.maxWidth*0.043),
                              child: Image.asset('images/scs_logo.png')
                          ),
                          Text('SCS Trade Pro',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize:  (constraints.maxWidth * (Theme.of(context).textTheme.bodyLarge!.fontSize!/480))
                          ),),
                          Gap(10),
                          CardIndices(),
                        ],
                      ),

                      SizedBox(
                          height: constraints.maxHeight*0.7,
                          child: MyTabBar(context))
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),

    );
  }


}

