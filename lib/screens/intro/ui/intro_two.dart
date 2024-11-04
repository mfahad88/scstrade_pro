import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../helper/Utils.dart';
import '../../../widgets/text_10.dart';
import '../../../widgets/text_13.dart';
import '../../../widgets/text_32.dart';

class IntroTwo extends StatelessWidget {
  const IntroTwo({super.key});

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, constraints) {

      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Gap(21),
          Image.asset('images/scs_logo.png'),
          Text('SCS Trade Pro',style: Theme.of(context).textTheme.headlineSmall,),
          Text32(data:'Real-Time Market Insights'),
          const Gap(100),
          Stack(
            clipBehavior: Clip.none,
            children: [
              _cardBox(context,constraints.maxWidth),
              Positioned(
                left: -30,
                top: -43,
                child: _cardBox(context,constraints.maxWidth),
              )
            ],
          ),

        ],
      );
    },);
  }

  SizedBox _cardBox(BuildContext context,double width) {
    return SizedBox(
        width: width*0.8,
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
                      side: const BorderSide(width: 0.66, color: Color(0xFF2CE52F)),
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
                          decoration: BoxDecoration(color: Utils.isDark(context)?const Color(0xFF2CE52F):const Color(0xFF0B4702)),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text13(
                                data: 'Deposits',
                              )
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
                              Text13(
                                  data:'Withdraw',
                                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                      color: const Color(0XFFA5A5A5)
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
                      const SizedBox(
                        width: double.infinity,
                        child: Text13(
                          data:'Enter amount',

                        ),
                      ),
                      const Gap(10),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(7.88),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 0.66, color: Color(0xFFE1E1E1)),
                            borderRadius: BorderRadius.circular(5.25),
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text13(
                              data:'USD \$100',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(23),
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
                          color: const Color(0xFFD6FFCC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.25),
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text13(
                              data:'+ \$100',
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
                          color: const Color(0xFFD6FFCC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.25),
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text10(
                              data:'+ \$500',
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
                          color: const Color(0xFFD6FFCC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.25),
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text10(
                              data:'+ \$1000',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(23),
                Container(
                  width: 288.16,
                  height: 37,
                  padding: const EdgeInsets.symmetric(horizontal: 7.88, vertical: 10.50),
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
                      Text13(
                        data:'Deposit money',
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
