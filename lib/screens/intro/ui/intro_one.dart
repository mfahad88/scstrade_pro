import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../helper/Utils.dart';

class IntroOne extends StatelessWidget {
  const IntroOne({super.key});

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, constraints) {
      double width=constraints.maxWidth;
      double height=constraints.maxHeight;
      return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Gap(height *0.05),
            Image.asset('images/scs_logo.png'),
            Text('SCS Trade Pro',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: (width*(Theme.of(context).textTheme.bodyLarge!.fontSize!*0.0025))
            ),),
            Text('Seamless Trading Experience',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: (width*(Theme.of(context).textTheme.headlineMedium!.fontSize!*0.004))
              ),
            ),
            Gap(height *0.10),
            Stack(
              clipBehavior: Clip.none,
              children: [
                _cardBox(context,width,height),
                Positioned(
                  left: -30,
                  top: -43,
                  child: _cardBox(context,width,height),
                )
              ],
            ),
        
          ],
        ),
      );
    },);
  }

  Widget _cardBox(BuildContext context,double width,double height) {
    return SizedBox(
        width: width*0.8,
        height: height*0.4,
        child: Card.outlined(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height * 0.04),
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
                          height: height*0.05,
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(color: Utils.isDark(context)?const Color(0xFF2CE52F):const Color(0xFF0B4702)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Deposits',
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: (width*(Theme.of(context).textTheme.bodyMedium!.fontSize!*0.0025))
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: height*0.05,
                          padding: const EdgeInsets.all(6.56),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Withdraw',
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: const Color(0XFFA5A5A5),
                                      fontSize: (width*(Theme.of(context).textTheme.bodyMedium!.fontSize!*0.0025))
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(width*0.05),
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
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: (width*(Theme.of(context).textTheme.bodyMedium!.fontSize!*0.0025))
                          ),

                        ),
                      ),
                      Gap(height*0.01),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(7.88),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 0.66, color: Color(0xFFE1E1E1)),
                            borderRadius: BorderRadius.circular(5.25),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('USD \$100',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: (width*(Theme.of(context).textTheme.bodyMedium!.fontSize!*0.0025))
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(width*0.025),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width*0.15,
                      height: height*0.035,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD6FFCC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.25),
                        ),
                      ),
                      child:Center(
                        child: Text('+ \$100',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1D1D1D),
                              fontSize: (width*(Theme.of(context).textTheme.bodyMedium!.fontSize!*0.0025))
                          ),
                        ),
                      ),
                    ),
                    Gap(width*0.02),
                    Container(
                      width: width*0.15,
                      height: height*0.035,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD6FFCC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.25),
                        ),
                      ),
                      child:Center(
                        child: Text('+ \$500',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1D1D1D),
                              fontSize: (width*(Theme.of(context).textTheme.bodyMedium!.fontSize!*0.0025))
                          ),
                        ),
                      ),
                    ),
                    Gap(width*0.02),
                    Container(
                      width: width*0.17,
                      height: height*0.035,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD6FFCC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.25),
                        ),
                      ),
                      child:Center(
                        child: Text('+ \$1000',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1D1D1D),
                              fontSize: (width*(Theme.of(context).textTheme.bodyMedium!.fontSize!*0.0025))
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(height*0.02),
                Container(
                  width: width*0.8,
                  height: height*0.05,
                  decoration: ShapeDecoration(
                    color: Utils.isDark(context)?const Color(0xFF2CE52F):const Color(0xFF0B4702),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.88),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Deposit money',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: (width*(Theme.of(context).textTheme.bodyMedium!.fontSize!*0.0025))
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
