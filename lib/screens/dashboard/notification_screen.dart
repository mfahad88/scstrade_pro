import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/provider/dashboard_viewmodel.dart';
import 'package:scstrade_pro/provider/theme_controller.dart';
import 'package:scstrade_pro/widgets/notification_row.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=context.read();
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back,color: Color(0xFF212121),)),
            title: const Text("Notification"),
          ),
          body: Consumer<DashboardViewmodel>(

              builder: (BuildContext context, DashboardViewmodel viewModel, Widget? child) {
                if(viewModel.notfications.isEmpty){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset('images/no_notification.png'),
                      Center(
                        child: Text("Empty",
                            style: themeController.themeData.textTheme.headlineLarge!.copyWith(
                                fontSize: 24)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Center(
                          child: Text("You don't have any notification at this time",style: themeController.themeData.textTheme.bodyMedium!.copyWith(
                              fontSize: 18
                          ),),
                        ),
                      )
                    ],
                  );
                }else{
                 return NotificationRow(notifications: viewModel.notfications);
                }
              }
          )
      ),
    );
  }
}
