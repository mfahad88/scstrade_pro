import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../helper/Utils.dart';

class IntroOne extends StatelessWidget {
  const IntroOne({super.key});

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, constraints) {

      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Gap(21),
          Image.asset('images/scs_logo.png'),
          Text('SCS Trade Pro',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: (constraints.maxWidth*(Theme.of(context).textTheme.bodyLarge!.fontSize!/480))
          ),),
          Text('Seamless Trading Experience',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: (constraints.maxWidth*(Theme.of(context).textTheme.headlineMedium!.fontSize!/480))
            ),),
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
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Deposits',
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: (width*(Theme.of(context).textTheme.bodyMedium!.fontSize!/480))
                                ),
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
                              Text('Withdraw',
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: const Color(0XFFA5A5A5),
                                      fontSize: (width*(Theme.of(context).textTheme.bodyMedium!.fontSize!/480))
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
                              fontSize: (width*(Theme.of(context).textTheme.bodyMedium!.fontSize!/480))
                          ),

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
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('USD \$100',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: (width*(Theme.of(context).textTheme.bodyMedium!.fontSize!/480))
                              ),
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
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('+ \$100',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF1D1D1D),
                                  fontSize: (width*(Theme.of(context).textTheme.bodyMedium!.fontSize!/480))
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
                          color: const Color(0xFFD6FFCC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.25),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('+ \$500',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF1D1D1D),
                                  fontSize: (width*(Theme.of(context).textTheme.bodyMedium!.fontSize!/480))
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
                          color: const Color(0xFFD6FFCC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.25),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('+ \$1000',
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF1D1D1D),
                                    fontSize: (width*(Theme.of(context).textTheme.bodyMedium!.fontSize!/480))
                                )
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
                      Text('Deposit money',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: (width*(Theme.of(context).textTheme.bodyMedium!.fontSize!/480))
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
