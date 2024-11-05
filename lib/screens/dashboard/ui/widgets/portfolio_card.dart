import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scstrade_pro/helper/Utils.dart';

class PortfolioCard extends StatelessWidget {
  const PortfolioCard({super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Container(

      padding: EdgeInsets.all((width*12/480)),
      decoration: ShapeDecoration(
        color: Utils.isDark(context)?Color(0xFF212121): Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Utils.isDark(context)?Color(0xFF2D2D2D):Color(0xFFE1E1E1)),
          borderRadius: BorderRadius.circular((width*12/480)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your Portfolio Value',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize!/480*width,
            fontWeight: FontWeight.w400,
            color: Utils.isDark(context)?Colors.white:const Color(0XFF222230)
          ),),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'PKR 198,876',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Utils.isDark(context)? Colors.white : Color(0xFF222230),
                    fontSize: (width*Theme.of(context).textTheme.headlineMedium!.fontSize!/480),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: '.00',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Utils.isDark(context)?Color(0xFF737180):Color(0xFF3A3A3A),
                    fontSize: (width*Theme.of(context).textTheme.titleLarge!.fontSize!/480),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        Container(
          width: (width * 118/480),
          height: (width * 28/480),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: ShapeDecoration(
            color: Utils.isDark(context)?Color(0xFF23372A):Color(0xFFF4FBF6),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.40, color: Color(0xFF1FAC53)),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.arrow_upward,color: Color(0xFF2CE52F),size: width * Theme.of(context).textTheme.labelSmall!.fontSize!/480,),
              Text( '+PKR ',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontSize: Theme.of(context).textTheme.labelSmall!.fontSize!/480*width
                ),
              ),
              Text( '29,409.06',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: Theme.of(context).textTheme.labelSmall!.fontSize!/480*width
                  ),
              )
            ],
          ),
        )
        ],
      )
    );
  }
}
