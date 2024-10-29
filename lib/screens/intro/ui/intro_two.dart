import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../helper/Utils.dart';

class IntroTwo extends StatelessWidget {
  const IntroTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Gap(21),
        Image.asset('images/scs_logo.png'),
        Text('SCS Trade Pro',style: TextStyle(fontSize: 16,color: Utils.isDark(context)?Colors.white:Colors.black),),
        Text('Real-Time Market Insights',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Utils.isDark(context)?Colors.white:Colors.black,
            fontSize: 32,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
        const Gap(100),
        Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
                width: 330,
                child: Card.outlined(
                  child: Padding(
                    padding: const EdgeInsets.all(21.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 0.66, color: Color(0xFF2CE52F)),
                              borderRadius: BorderRadius.circular(7.88),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 29,
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(color: Utils.isDark(context)?Color(0xFF2CE52F):Color(0xFF0B4702)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Deposits',
                                        style: TextStyle(
                                          color: Utils.isDark(context)?const Color(0xFF1D1D1D):const Color(0xFF2CE52F),
                                          fontSize: 13.13,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 29.13,
                                  padding: const EdgeInsets.all(6.56),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Withdraw',
                                        style: TextStyle(
                                          color: Color(0XFFA5A5A5),
                                          fontSize: 13.13,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(23),
                        Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'Enter amount',
                                  style: TextStyle(
                                    color: Color(0xFF1D1D1D),
                                    fontSize: 13.13,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10.50),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(7.88),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(width: 0.66, color: Color(0xFFE1E1E1)),
                                    borderRadius: BorderRadius.circular(5.25),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'USD \$100',
                                      style: TextStyle(
                                        color: Color(0xFF1D1D1D),
                                        fontSize: 13.13,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(23),
                        Container(
                          width: 200,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 56,
                                height: 24.50,
                                padding: const EdgeInsets.all(5.25),
                                decoration: ShapeDecoration(
                                  color: Color(0xFFD6FFCC),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.25),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '+ \$100',
                                      style: TextStyle(
                                        color: Color(0xFF1D1D1D),
                                        fontSize: 10.50,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5.25),
                              Container(
                                width: 56,
                                height: 24.50,
                                padding: const EdgeInsets.all(5.25),
                                decoration: ShapeDecoration(
                                  color: Color(0xFFD6FFCC),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.25),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '+ \$500',
                                      style: TextStyle(
                                        color: Color(0xFF1D1D1D),
                                        fontSize: 10.50,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5.25),
                              Container(
                                width: 56,
                                height: 24.50,
                                padding: const EdgeInsets.all(5.25),
                                decoration: ShapeDecoration(
                                  color: Color(0xFFD6FFCC),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.25),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '+ \$1000',
                                      style: TextStyle(
                                        color: Color(0xFF1D1D1D),
                                        fontSize: 10.50,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(23),
                        Container(
                          width: 288.16,
                          height: 37,
                          padding: const EdgeInsets.symmetric(horizontal: 7.88, vertical: 10.50),
                          decoration: ShapeDecoration(
                            color: Color(0xFF2CE52F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.88),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Deposit money',
                                style: TextStyle(
                                  color: Color(0xFFD2D2D2),
                                  fontSize: 13.13,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w600,
                                  height: 0.09,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ),
            Positioned(
              left: -30,
              top: -43,
              child: SizedBox(
                  width: 330,
                  child: Card.outlined(
                    child: Padding(
                      padding: const EdgeInsets.all(21.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 0.66, color: Color(0xFF2CE52F)),
                                borderRadius: BorderRadius.circular(7.88),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 29,
                                    padding: const EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(color: Utils.isDark(context)?Color(0xFF2CE52F):Color(0xFF0B4702)),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Deposits',
                                          style: TextStyle(
                                            color: Utils.isDark(context)?const Color(0xFF1D1D1D):const Color(0xFF2CE52F),
                                            fontSize: 13.13,
                                            fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 29.13,
                                    padding: const EdgeInsets.all(6.56),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Withdraw',
                                          style: TextStyle(
                                            color: Color(0XFFA5A5A5),
                                            fontSize: 13.13,
                                            fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(23),
                          Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    'Enter amount',
                                    style: TextStyle(
                                      color: Color(0xFF1D1D1D),
                                      fontSize: 13.13,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10.50),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(7.88),
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 0.66, color: Color(0xFFE1E1E1)),
                                      borderRadius: BorderRadius.circular(5.25),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'USD \$100',
                                        style: TextStyle(
                                          color: Color(0xFF1D1D1D),
                                          fontSize: 13.13,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(23),
                          Container(
                            width: 200,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 56,
                                  height: 24.50,
                                  padding: const EdgeInsets.all(5.25),
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFD6FFCC),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.25),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '+ \$100',
                                        style: TextStyle(
                                          color: Color(0xFF1D1D1D),
                                          fontSize: 10.50,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 5.25),
                                Container(
                                  width: 56,
                                  height: 24.50,
                                  padding: const EdgeInsets.all(5.25),
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFD6FFCC),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.25),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '+ \$500',
                                        style: TextStyle(
                                          color: Color(0xFF1D1D1D),
                                          fontSize: 10.50,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 5.25),
                                Container(
                                  width: 56,
                                  height: 24.50,
                                  padding: const EdgeInsets.all(5.25),
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFD6FFCC),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.25),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '+ \$1000',
                                        style: TextStyle(
                                          color: Color(0xFF1D1D1D),
                                          fontSize: 10.50,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(23),
                          Container(
                            width: 288.16,
                            height: 37,
                            padding: const EdgeInsets.symmetric(horizontal: 7.88, vertical: 10.50),
                            decoration: ShapeDecoration(
                              color: Color(0xFF0B4702),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.88),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Deposit money',
                                  style: TextStyle(
                                    color: Color(0xFF2CE52F),
                                    fontSize: 13.13,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w600,
                                    height: 0.09,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ),
            )
          ],
        ),

      ],
    );
  }
}
