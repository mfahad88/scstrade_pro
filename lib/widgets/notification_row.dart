import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';

import '../helper/Utils.dart';
import '../models/daily_notification.dart';

class NotificationRow extends StatelessWidget {
  final List<DailyNotification> notifications;
  const NotificationRow({super.key,required this.notifications});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=context.read();
    return ShaderMask(
      shaderCallback: (Rect rect) {
        return  LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ Colors.transparent, Utils.isDark(context)?const Color(0xFF1F222A):Colors.white],
          //set stops as par your requirement
          stops: const [0.93, 1.0], // 50% transparent, 50% white
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: ListView.separated(

          itemBuilder: (context, index) {
        return Container(
          color: Utils.isDark(context)?const Color(0xFF1F222A):Colors.white ,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset('images/security_updates.png'),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 5),
                          child: Text(notifications[index].title,
                              style: themeController.themeData.textTheme.headlineLarge!.copyWith(
                                  fontSize: 18,
                                color: Utils.isDark(context)?Colors.white:const Color(0xFF1F222A)
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 5),
                          child: Text(notifications[index].date,
                            style: themeController.themeData.textTheme.bodyMedium!.copyWith(
                              color: Utils.isDark(context)?Colors.white:const Color(0xFF1F222A)
                            ),),
                        ),

                      ],
                    ),
                    const Spacer(),
                    notifications[index].isRead?Container(
                      width: 41,
                      height: 24,
                      margin: const EdgeInsets.only(right: 10,top: 5),
                      decoration: const BoxDecoration(
                          color: Color(0xFF12D18E),
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      ),

                      child: Center(
                        child: Text('New',style: themeController.themeData.textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                            fontSize: 12
                        ),),
                      ),
                    ): Container(),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15,bottom: 10),
                  child: Text('Now Otrade has a Two-Factor Authentication. Try it now to make your account more secure.',
                    style: themeController.themeData.textTheme.labelSmall!.copyWith(
                      color: Utils.isDark(context)?Colors.white:const Color(0xFF1F222A)
                    ),),
                )
              ],
            ),
          ),
        );
      }, separatorBuilder: (context, index) => Container(
        color: Utils.isDark(context)?const Color(0xFF1F222A):Colors.white,
          child: const Divider()), itemCount: notifications.length),
    );
  }
}
