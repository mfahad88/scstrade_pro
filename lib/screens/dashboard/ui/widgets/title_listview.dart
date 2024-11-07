import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../helper/Utils.dart';
import '../../../../widgets/my_text.dart';

class TitleListview extends StatelessWidget {
  final double width;
  final String? title;
  const TitleListview({super.key,required this.width,this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(title,textSize: 20,
          myStyle: const TextStyle().copyWith(
              color: Utils.isDark(context)?Colors.white:const Color(0xFF5A5A5C),
              fontWeight: FontWeight.w400
          ),
        ),
        const Gap(2.0),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(12),
              decoration: ShapeDecoration(
                color: Utils.isDark(context)?const Color(0XFF212121):Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                        color: Utils.isDark(context)?const Color(0xFF2D2D2D):const Color(0xFFE1E1E1)
                    )
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FlutterLogo(
                    size: width * 44/480,
                  ),
                  const Gap(4.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText('Unity',textSize: 16,
                        myStyle: const TextStyle().copyWith(
                            color: Utils.isDark(context)?Colors.white:const Color(0xFF222230),
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      MyText('Unity Foods LTD',textSize: 12,
                        myStyle: const TextStyle().copyWith(
                            color: Utils.isDark(context)?const Color(0xFF737180):const Color(0xFF3A3A3A),
                            fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      MyText('69.48',textSize: 16,
                        myStyle: const TextStyle().copyWith(
                            color: Utils.isDark(context)?Colors.white:const Color(0xFF222230),
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      MyText('69.42',textSize: 12,
                        myStyle: const TextStyle().copyWith(
                            color: Utils.isDark(context)?const Color(0xFF737180):const Color(0xFF3A3A3A),
                            fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  ),
                  Gap(8.0),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: ShapeDecoration(
                      color: Utils.isDark(context)?Color(0XFF23372A):Color(0xFFF4FBF6),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Color(0xFF1FAC53),width: 0.4),
                          borderRadius: BorderRadius.circular(8)
                        )
                    ),
                    child: MyText('+4.14%',textSize: 16,
                    myStyle: TextStyle().copyWith(
                      color: Color(0xFF1FAC53),
                      fontWeight: FontWeight.w500
                    ),),
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
