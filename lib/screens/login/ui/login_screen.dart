import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/login/viewmodel/login_viewmodel.dart';
import 'package:scstrade_pro/widgets/drop_index.dart';

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
              return Column(
                children: [
                  Gap(21),
                  Image.asset('images/scs_logo.png'),
                  Text('SCS Trade Pro',style: Theme.of(context).textTheme.headlineSmall,),
                  Container(
                    decoration: ShapeDecoration(
                      color: Color(0xFF142117),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFF333333)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 34,
                          offset: Offset(0, 24),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        DropIndex(value: viewModel.selectedValue, items: viewModel.indices?.map((e) => e.indexCode,).toList()??List.empty(), onChanged: (value) {
                          viewModel.selectedValue=value;
                        },)
                      ],
                    ),
                  )
                ],
              );
            },
        ),
      ],
    );
  }
}
