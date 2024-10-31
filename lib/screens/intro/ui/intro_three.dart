import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../helper/Utils.dart';

class IntroThree extends StatelessWidget {
  const IntroThree({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Gap(21),
            Image.asset('images/scs_logo.png'),
            Text('SCS Trade Pro',style: Theme.of(context).textTheme.headlineSmall,),
            Text('Manage Your Portfolio with Ease',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Gap(width*0.15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                    color: Utils.isDark(context)?Color(0xFF142117):Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.64, color: Color(0xFF5A5A5A)),
                      borderRadius: BorderRadius.circular(12.72),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 24,
                        offset: Offset(0, 14),
                        spreadRadius: 0,
                      )
                    ]
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Stocks',
                            style: TextStyle(
                              color: Color(0xFF2CE52F),
                              fontSize: 20.35,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                              height: 0.06,
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 30.53,
                            child: Text(
                              '04',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF1D1D1D),
                                fontSize: 12.72,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w400,
                                height: 0.14,
                              ),
                            ),
                          )
                        ],
                      ),
                      Gap(30),
                      ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Column(
                            children: [
                              Row(

                                children: [
                                  Text(
                                    'Infosys',
                                    style: TextStyle(
                                      color: Utils.isDark(context)?Colors.white:Color(0xFF1D1D1D),
                                      fontSize: 15.26,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w600,
                                      height: 0.07,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '\$1,821.02',
                                    style: TextStyle(
                                      color: Utils.isDark(context)?Colors.white:Color(0xFF1D1D1D),
                                      fontSize: 15.26,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w600,
                                      height: 0.07,
                                    ),
                                  )
                                ],
                              ),
                              Gap(15),
                              Row(
                                children: [
                                  Text(
                                    'NSE',
                                    style: TextStyle(
                                      color: Color(0xFF777777),
                                      fontSize: 12.72,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w600,
                                      height: 0.09,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '-31,40 (1.69%)',
                                    style: TextStyle(
                                      color: Color(0xFFDA073B),
                                      fontSize: 12.72,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w600,
                                      height: 0.09,
                                    ),
                                  )
                                ],
                              ),
                              Gap(30),
                              Row(

                                children: [
                                  Text(
                                    'Infosys',
                                    style: TextStyle(
                                      color: Utils.isDark(context)?Colors.white:Color(0xFF1D1D1D),
                                      fontSize: 15.26,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w600,
                                      height: 0.07,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '\$1,821.02',
                                    style: TextStyle(
                                      color:Utils.isDark(context)?Colors.white:Color(0xFF1D1D1D),
                                      fontSize: 15.26,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w600,
                                      height: 0.07,
                                    ),
                                  )
                                ],
                              ),
                              Gap(15),
                              Row(
                                children: [
                                  Text(
                                    'NSE',
                                    style: TextStyle(
                                      color: Color(0xFF777777),
                                      fontSize: 12.72,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w600,
                                      height: 0.09,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '-31,40 (1.69%)',
                                    style: TextStyle(
                                      color: Color(0xFFDA073B),
                                      fontSize: 12.72,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w600,
                                      height: 0.09,
                                    ),
                                  )
                                ],
                              ),
                              Gap(30),
                              Row(

                                children: [
                                  Text(
                                    'Infosys',
                                    style: TextStyle(
                                      color: Utils.isDark(context)?Colors.white:Color(0xFF1D1D1D),
                                      fontSize: 15.26,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w600,
                                      height: 0.07,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '\$1,821.02',
                                    style: TextStyle(
                                      color: Utils.isDark(context)?Colors.white:Color(0xFF1D1D1D),
                                      fontSize: 15.26,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w600,
                                      height: 0.07,
                                    ),
                                  )
                                ],
                              ),
                              Gap(15),
                              Row(
                                children: [
                                  Text(
                                    'NSE',
                                    style: TextStyle(
                                      color: Color(0xFF777777),
                                      fontSize: 12.72,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w600,
                                      height: 0.09,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '-31,40 (1.69%)',
                                    style: TextStyle(
                                      color: Color(0xFFDA073B),
                                      fontSize: 12.72,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w600,
                                      height: 0.09,
                                    ),
                                  )
                                ],
                              ),
                              Gap(30),
                              Row(

                                children: [
                                  Text(
                                    'Infosys',
                                    style: TextStyle(
                                      color: Utils.isDark(context)?Colors.white:Color(0xFF1D1D1D),
                                      fontSize: 15.26,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w600,
                                      height: 0.07,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '\$1,821.02',
                                    style: TextStyle(
                                      color:Utils.isDark(context)?Colors.white:Color(0xFF1D1D1D),
                                      fontSize: 15.26,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w600,
                                      height: 0.07,
                                    ),
                                  )
                                ],
                              ),
                              Gap(15),
                              Row(
                                children: [
                                  Text(
                                    'NSE',
                                    style: TextStyle(
                                      color: Color(0xFF777777),
                                      fontSize: 12.72,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w600,
                                      height: 0.09,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '-31,40 (1.69%)',
                                    style: TextStyle(
                                      color: Color(0xFFDA073B),
                                      fontSize: 12.72,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w600,
                                      height: 0.09,
                                    ),
                                  )
                                ],
                              ),
                              Gap(30),
                              Row(

                                children: [
                                  Text(
                                    'Infosys',
                                    style: TextStyle(
                                      color:Utils.isDark(context)?Colors.white:Color(0xFF1D1D1D),
                                      fontSize: 15.26,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w600,
                                      height: 0.07,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '\$1,821.02',
                                    style: TextStyle(
                                      color: Utils.isDark(context)?Colors.white:Color(0xFF1D1D1D),
                                      fontSize: 15.26,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w600,
                                      height: 0.07,
                                    ),
                                  )
                                ],
                              ),
                              Gap(15),
                              Row(
                                children: [
                                  Text(
                                    'NSE',
                                    style: TextStyle(
                                      color: Color(0xFF777777),
                                      fontSize: 12.72,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w600,
                                      height: 0.09,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '-31,40 (1.69%)',
                                    style: TextStyle(
                                      color: Color(0xFFDA073B),
                                      fontSize: 12.72,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w600,
                                      height: 0.09,
                                    ),
                                  )
                                ],
                              ),
                              Gap(30),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )

          ],
        );
      },
    );
  }
}
