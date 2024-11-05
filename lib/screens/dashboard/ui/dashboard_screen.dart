import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/screens/dashboard/ui/viewmodel/dashboard_viewmodel.dart';
import 'package:scstrade_pro/screens/dashboard/ui/widgets/card_index.dart';
import 'package:scstrade_pro/screens/dashboard/ui/widgets/portfolio_card.dart';
import 'package:scstrade_pro/widgets/my_text.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Consumer<DashboardViewModel>(
      builder: (BuildContext context, DashboardViewModel value, Widget? child) {
        return Padding(
          padding: const EdgeInsets.all(12),
          child: ListView(
            children: [
              PortfolioCard(),
              Gap(10),
              Container(
                height: width*100/480,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,

                  itemBuilder: (context, index) {
                    return CardIndex();
                  },),
              )
            ],

          ),
        );
      },

    );
  }


}
