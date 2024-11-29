import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/screens/companyProfile/ui/fundamental_screen.dart';
import 'package:scstrade_pro/screens/companyProfile/ui/overview_screen.dart';
import 'package:scstrade_pro/screens/companyProfile/ui/profile_screen.dart';
import 'package:scstrade_pro/screens/companyProfile/viewmodel/company_profile_viewmodel.dart';

class CompanypprofileScreen extends StatelessWidget {
  const CompanypprofileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            child: Container(
                decoration: ShapeDecoration(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            width: 1,
                            color: Color(0xFF0B4702)
                        )
                    )
                ),
                child: Icon(Icons.arrow_back_ios_sharp,color: Color(0xFF0B4702),)
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Unity',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w500,
            ),
            ),
            Text('Unity Foods LTD',style: Theme.of(context).textTheme.labelSmall,)
          ],
        ),
      ),
      body: Consumer<CompanyProfileViewModel>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(4, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: FilledButton(
                                style: FilledButton.styleFrom(
                                  backgroundColor:  index==value.selectedIndex?const Color(0xFF48C0E0):Utils.isDark(context)?Color(0xFF212121):const Color(0xFFF5F5F5),
                                  foregroundColor: index==value.selectedIndex?Colors.white:const Color(0xFF3A3A3A),
                                ),
                                onPressed: () => value.selectedIndex=index,
                                child: Text(index==0?'Overview':index==1?'Profile':index==2?'Fundamental':'Annual Statement',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                )
                            ),
                          );
                        },
                        ),
                      ),
                    ),
                    Gap(10),
                    value.selectedIndex==0?OverviewScreen():value.selectedIndex==1?ProfileScreen():value.selectedIndex==2?FundamentalScreen():Container()
                  ]
              ),
            );
          }
      ),
    );
  }
}
