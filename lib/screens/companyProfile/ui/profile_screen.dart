import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scstrade_pro/screens/companyProfile/ui/widget/ExpandedTile.dart';
import 'package:scstrade_pro/screens/companyProfile/ui/widget/RoundedContainer.dart';
import 'package:scstrade_pro/widgets/my_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Column(
      children: [
        Expandedtile(title: 'Description',
            body: [
              MyText('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                textSize: 12,
                myStyle: TextStyle().copyWith(
                    color:Color(0xFF222230)
                ),)
            ]
        ),
        Gap(8.0),
        Expandedtile(title: 'Contact Information',
            body: [
              Row(
                children: [
                  Card.outlined(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 12),
                      child: SizedBox(
                        width: width*0.23,
                        height: height*0.1,
                        child: Column(
                          children: [
                            Icon(Icons.phone),
                            MyText('Phone Number',
                              textSize: 12,
                              myStyle: TextStyle().copyWith(
                                  color: Color(0xFF0B4702)
                              ),),
                            MyText('+1*********34',textSize: 16,)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card.outlined(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 12),
                      child: SizedBox(
                        width: width*0.23,
                        height: height*0.1,
                        child: Column(
                          children: [
                            Icon(Icons.pin_drop_outlined),
                            MyText('Address',
                              textSize: 12,
                              myStyle: TextStyle().copyWith(
                                  color: Color(0xFF0B4702)
                              ),),
                            MyText('Clifton Block 9, Karachi, Pakistan',textSize: 16,maxLines: 2,)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card.outlined(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 12),
                      child: SizedBox(
                        width: width*0.23,
                        height: height*0.1,
                        child: Column(
                          children: [
                            Icon(Icons.wordpress),
                            MyText('Web',
                              textSize: 12,
                              myStyle: TextStyle().copyWith(
                                  color: Color(0xFF0B4702)
                              ),),
                            MyText('+1*********34',textSize: 16,)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ]
        ),
        Gap(8.0),
        Expandedtile(title: 'Equality Profile',
            body: [
              RoundedContainer(text1: 'Authorized Capital', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Paid Up Capital', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Issued Shares', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Free Float Shares', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: '%Free Float', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Per Value/Share (PKR)', text2: 'Add Text or Value'),
              Gap(10),
            ]
        ),
        Gap(8.0),

        Expandedtile(title: 'Top Executives',
            body: [
              RoundedContainer(text1: 'Designation', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Designation', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Designation', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Designation', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Designation', text2: 'Add Text or Value'),
              Gap(4),
            ]
        ),
        Gap(8.0),
        Expandedtile(title: 'Share Holders',
            body: [
              RoundedContainer(text1: 'Designation', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Designation', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Designation', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Designation', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Designation', text2: 'Add Text or Value'),
              Gap(4),
            ]
        )
      ],
    );
  }
}
