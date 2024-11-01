import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/login/viewmodel/login_viewmodel.dart';

import '../../../helper/Utils.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor:Colors.transparent,
        appBar: AppBar(
          backgroundColor:Colors.transparent,
          bottom: TabBar(
            indicatorColor: Utils.isDark(context)?Color(0xFF2CE52F):Color(0xFF0B4702),
            labelColor: Utils.isDark(context)?Color(0xFF2CE52F):Color(0xFF0B4702),
            unselectedLabelColor: Utils.isDark(context)?Colors.white:Color(0xFFC0C0CB),
            dividerColor: Colors.transparent,
            tabs: <Widget>[
              Tab(
                child: Text(
                  'Real Trading',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w600,
                    height: 0.06,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Virtual Trading',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                    height: 0.06,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => TabBarView(
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth*0.033, vertical: constraints.maxWidth*0.05),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1,color:Utils.isDark(context)?Color(0xFF737180):Color(0xFFE1E1E1)),
                            borderRadius: BorderRadius.circular(8),
                          )
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth*0.033, vertical: constraints.maxWidth*0.0025),
                    child: SizedBox(
                      width: double.infinity,
                      child: Consumer<LoginViewModel>(
                        builder: (BuildContext context, LoginViewModel value, Widget? child) {
                          return  TextField(
                            obscureText: value.obscureText,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(onPressed: () => value.obscureText=!value.obscureText, icon: Icon(value.obscureText?Icons.visibility:Icons.visibility_off)),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1,color:Utils.isDark(context)?Color(0xFF737180):Color(0xFFE1E1E1)),
                                  borderRadius: BorderRadius.circular(8),
                                )
                            ),

                          );
                        },

                      ),
                    ),
                  ),
                ],
              ),
              Column(

              ),
            ],
          ),
        ),
      ),
    );
  }
}
