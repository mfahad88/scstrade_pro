import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/screens/dashboard/ui/widgets/title_listview.dart';
import 'package:scstrade_pro/screens/dashboard/viewmodel/dashboard_viewmodel.dart';
import 'package:scstrade_pro/screens/dashboard/ui/widgets/card_index.dart';
import 'package:scstrade_pro/screens/dashboard/ui/widgets/portfolio_card.dart';
import 'package:scstrade_pro/screens/viewmodel/shared_viewmodel.dart';
import 'package:scstrade_pro/widgets/chip.dart';
import 'package:scstrade_pro/widgets/drop_index.dart';
import 'package:scstrade_pro/widgets/my_text.dart';
import 'package:scstrade_pro/widgets/rounded_container.dart';

import '../../../widgets/volume_index.dart';

class DashboardScreen extends StatelessWidget {
  final BuildContext context;
  const DashboardScreen(this.context,{super.key});

  @override
  Widget build(BuildContext _) {
    double width=MediaQuery.of(context).size.width;

    return Consumer<DashboardViewModel>(
      builder: (BuildContext _, DashboardViewModel value, Widget? child) {

        return value.isLoading?Center(child: CircularProgressIndicator(),):Padding(
          padding: const EdgeInsets.all(12),
          child: ListView(
            children: [

              const PortfolioCard(),
              const Gap(10),
              Container(
                height: width*100/480,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: value.kseIndices.where((element) => element.indexCode!="KSE All Share Index",).toList().length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: CardIndex(value.kseIndices.where((element) => element.indexCode!="KSE All Share Index",).toList()[index]),
                    );
                  },
                ),
              ),
              const Gap(10),
              RoundedContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: width*4/480,horizontal: width*10/480),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          DropIndex(value: value.selectedValue,
                            items: /*value.kseIndices.where((element) => element.indexCode!='KSE All Share Index',).map((e) => e.indexCode,).toList()*/['KSE 100','KSE 30','KMI 30'],
                            onChanged: (v) {
                              value.selectedValue=v.toString();
                              value.fetchGroupIndex(v);
                            },
                          ),
                          const Spacer(),
                          MyText('Volume:',
                            textSize: 16,
                            myStyle: const TextStyle().copyWith(
                                color: Utils.isDark(context)?Colors.white:const Color(0xFF222230)
                            ),
                          ),
                          const Gap(2.0),
                          MyText(Utils.formatToMillions(double.parse(value.kseIndices.where((element) => element.indexCode?.contains(value.selectedValue)??false,).first.volumeTraded??'0.0')),
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
                            Utils.commaSeparated(value.kseIndices.where((element) => element.indexCode?.contains(value.selectedValue)??false,).first.currentIndex),
                            textSize: 34,
                            style: const TextStyle().copyWith(
                                fontWeight: FontWeight.w600,
                                color: Utils.isDark(context)?Colors.white:const Color(0xFF222230)
                            ),
                          ),
                          const Spacer(),
                          mChip(
                            changePercent: '${Utils.roundTwoDecimal(value.percentChange)}%',
                            changeValue: Utils.roundTwoDecimal(value.netChange),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const Gap(10),
              /*Container(                                  //Discussed by ahsan not needed
                height: width*115/480,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Container(
                      width: width*200/480,
                      decoration: ShapeDecoration(
                        color: Utils.isDark(context)?const Color(0XFF212121):Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1,color: Utils.isDark(context)?const Color(0xFF2D2D2D):const Color(0xFFE1E1E1)),
                            borderRadius: BorderRadius.circular(12)
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(width*12/480),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                MyText('REGULAR',
                                  textSize: 14,
                                  myStyle: const TextStyle().copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Utils.isDark(context)?Colors.white:const Color(0xFF222230)
                                  ),
                                ),
                                const Spacer(),
                                Container(

                                  padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 2.0),
                                  decoration: ShapeDecoration(
                                      color: const Color(0XFFE6263D),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4.0)
                                      )),
                                  child: MyText('Closed',
                                    textSize: 10,
                                    myStyle: const TextStyle().copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const Gap(5.0),
                            Row(
                              children: [
                                MyText('Trade',textSize: 12,
                                  myStyle: const TextStyle().copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Utils.isDark(context)?Colors.white:const Color(0xFF5A5A5C)
                                  ),
                                ),
                                const Spacer(),
                                MyText('271,840',textSize: 12,
                                  myStyle: const TextStyle().copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Utils.isDark(context)?Colors.white:const Color(0xFF5A5A5C)
                                  ),
                                ),
                              ],
                            ),
                            const Gap(2.0),
                            Row(
                              children: [
                                MyText('Volume',textSize: 12,
                                  myStyle: const TextStyle().copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Utils.isDark(context)?Colors.white:const Color(0xFF5A5A5C)
                                  ),
                                ),
                                const Spacer(),
                                MyText('546,275m',textSize: 12,
                                  myStyle: const TextStyle().copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Utils.isDark(context)?Colors.white:const Color(0xFF5A5A5C)
                                  ),
                                ),
                              ],
                            ),
                            const Gap(2.0),
                            Row(
                              children: [
                                MyText('Value',textSize: 12,
                                  myStyle: const TextStyle().copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Utils.isDark(context)?Colors.white:const Color(0xFF5A5A5C)
                                  ),
                                ),
                                const Spacer(),
                                MyText('PKR 24,117.21m',textSize: 12,
                                  myStyle: const TextStyle().copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Utils.isDark(context)?Colors.white:const Color(0xFF5A5A5C)
                                  ),
                                ),
                              ],
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),*/
              Consumer<SharedViewModel>(
                builder: (BuildContext context, SharedViewModel sharedValue, Widget? child) {
                  return Column(
                    children: [
                      const Gap(10.0),

                      TitleListview(width: width,title: 'Leaders',indexGroups: (sharedValue.stockData..sort((a, b) => b.v!.compareTo(a.v!))).take(10).toList(),),
                      const Gap(10.0),
                      TitleListview(width: width,title: 'Gainers',indexGroups: (sharedValue.stockData..sort((a, b) => b.chp!.compareTo(a.chp!))).take(10).toList()),
                      const Gap(10.0),
                      TitleListview(width: width,title: 'Losers',indexGroups: (sharedValue.stockData..sort((a, b) => a.chp!.compareTo(b.chp!))).take(10).toList()),
                    ],
                  );
                },

              )
            ],
          ),
        );
      },

    );
  }


}
