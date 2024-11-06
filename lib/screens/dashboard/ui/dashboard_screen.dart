import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/screens/dashboard/viewmodel/dashboard_viewmodel.dart';
import 'package:scstrade_pro/screens/dashboard/ui/widgets/card_index.dart';
import 'package:scstrade_pro/screens/dashboard/ui/widgets/portfolio_card.dart';
import 'package:scstrade_pro/widgets/chip.dart';
import 'package:scstrade_pro/widgets/drop_index.dart';
import 'package:scstrade_pro/widgets/my_text.dart';
import 'package:scstrade_pro/widgets/rounded_container.dart';

import '../../../widgets/volume_index.dart';

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
                    return Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: CardIndex(),
                    );
                  },
                ),
              ),
              Gap(10),
              RoundedContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: width*4/480,horizontal: width*10/480),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          DropIndex(value: 'KSE 100',
                            items: ['KSE 100','KSE 30','KMI All','KMI 30'],
                            onChanged: (value) {
                              print(value);
                            },
                          ),
                          Spacer(),
                          MyText('Volume:',
                            textSize: 16,
                            myStyle: const TextStyle().copyWith(
                              color: Utils.isDark(context)?Colors.white:const Color(0xFF222230)
                            ),
                          ),
                          Gap(2.0),
                          MyText('365.941m',
                            textSize: 16,
                            myStyle: const TextStyle().copyWith(
                                color: Utils.isDark(context)?Colors.white:const Color(0xFF222230)
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          VolumeIndex(
                            '86,466.57',
                            textSize: 34,
                            style: TextStyle().copyWith(
                                fontWeight: FontWeight.w600,
                                color: Utils.isDark(context)?Colors.white:Color(0xFF222230)
                            ),
                          ),
                          Spacer(),
                          mChip(
                            changePercent: '0.47%',
                            changeValue: '+409.06',
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],

          ),
        );
      },

    );
  }


}
