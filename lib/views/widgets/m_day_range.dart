import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class mDayRange extends StatelessWidget {
  final color=[0xFFA50026,0xFFD73027,0xFFF46D43,0xFFFDAE61,0xFFFEE08B,0xFFD9EF8B,0xFFA6D96A,0xFF66BD63,0xFF1A9850,0xFF006837];
  final double minValue;
  final double maxValue;
  final double currentValue;
  mDayRange({super.key, required this.minValue, required this.maxValue, required this.currentValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            print(constraints.maxWidth);
            double barWidth = constraints.maxWidth; // Get bar width
            double position = ((currentValue - minValue) /
                ((maxValue) - minValue)) *
                barWidth; // Calculate arrow position
            return Container(
              height: 30.r,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    height: 10.r,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {

                        return Container(
                          width: 30.r,
                          height: 10.r,
                          decoration: ShapeDecoration(
                            color: Color(color[index]),
                            shape: RoundedRectangleBorder(
                              borderRadius: index==0? BorderRadius.only(
                                topLeft: Radius.circular(50.r),
                                bottomLeft: Radius.circular(50.r),
                              ):index==9?BorderRadius.only(
                                topRight: Radius.circular(50.r),
                                bottomRight: Radius.circular(50.r),
                              ):BorderRadius.only(),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Gap(2.r),),

                  ),
                  Positioned(
                    left: position, // Dynamic arrow position
                    bottom: 0,
                    child: Icon(
                      Icons.arrow_drop_up,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
