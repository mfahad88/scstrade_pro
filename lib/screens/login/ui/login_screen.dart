import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/login/ui/widgets/card_indices.dart';
import 'package:scstrade_pro/screens/login/ui/widgets/my_tab_bar.dart';
import 'package:scstrade_pro/screens/login/viewmodel/login_viewmodel.dart';

import '../../../helper/Utils.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel=Provider.of(context,listen: false);
    viewModel.fetchIndices();
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: Utils.isDark(context)?const AssetImage('images/bg_dark.png'):const AssetImage('images/bg_light.png'),fit: BoxFit.fill)
            )
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        margin:EdgeInsets.only(top:constraints.maxWidth*0.043),
                          child: Image.asset('images/scs_logo.png')
                      ),
                      Text('SCS Trade Pro',style: Theme.of(context).textTheme.headlineSmall,),
                      Gap(10),
                      CardIndices(),
                    ],
                  ),
                  SizedBox(
                      height: constraints.maxHeight*0.7,
                      child: MyTabBar())
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
