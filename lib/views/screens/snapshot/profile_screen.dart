import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/models/data/stock_card_data.dart';
import 'package:scstrade_pro/theme/theme.dart';
import 'package:scstrade_pro/viewmodels/company_viewmodel.dart';
import 'package:scstrade_pro/views/widgets/m_rounded_container.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  final BuildContext context;
  final StockCardData stockCardData;
  const ProfileScreen({super.key, required this.context, required this.stockCardData});

  @override
  Widget build(BuildContext _) {
    return Consumer<CompanyViewModel>(
      builder: (context,value,child) {
        return Column(
          children: [
            mRoundedContainer(
                padding: EdgeInsets.all(15.r),
                color: Color(0xFFFCF8F8),
                side: BorderSide(width: 1.r, color: Color(0xFFE5E2E1)),
                borderRadius: BorderRadius.circular(12.r),
                child: _aboutCompany(context,value)
            ),
            Gap(15.r),
            mRoundedContainer(
                padding: EdgeInsets.all(15.r),
                color: Color(0xFFFCF8F8),
                side: BorderSide(width: 1.r, color: Color(0xFFE5E2E1)),
                borderRadius: BorderRadius.circular(12.r),
                child: _informationContact(context,value)
            ),
            Gap(15.r),
            mRoundedContainer(
                color: Color(0xFFFCF8F8),
                side: BorderSide(width: 1.r, color: Color(0xFFE5E2E1)),
                borderRadius: BorderRadius.circular(12.r),
                child: _executiveName(context,value)
            )
          ],
        );
      }
    );
  }

  _aboutCompany(BuildContext context, CompanyViewModel value) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'About Company:',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: MaterialTheme.lightScheme().primary,
                fontWeight: FontWeight.w700,
                fontSize: 20.r,
                height: 1.35,
                letterSpacing: -0.40,
              ),

            )
          ],
        ),
        Gap(6.r),
        Wrap(
          children: [
            Text(HtmlUnescape().convert(value.apiResponseOverview.data?.description??''),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                height: 1.88,
                letterSpacing: -0.32,
              ),
            )
          ],
        ),
      ],
    );
  }

  _informationContact(BuildContext context, CompanyViewModel value) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Information & Contact:',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: MaterialTheme.lightScheme().primary,
                fontWeight: FontWeight.w700,
                fontSize: 20.r,
                height: 1.35,
                letterSpacing: -0.40,
              ),
            ),
          ],
        ),
        Gap(15.r),
        Row(
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Registrar:',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.black,
                    fontSize: 18.r,
                    fontWeight: FontWeight.w700,
                    height: 1.67,
                    letterSpacing: -0.36,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'CDC-Share Registrar Services Limited,\nCDC House, 99-B, Block-B, S.M.C.H.S.,\nMain Shahrah-e-Faisal, Karachi',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        height: 1.75,
                        letterSpacing: -0.32,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
        Gap(12.r),
        Row(
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Auditor:',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.black,
                    fontSize: 18.r,
                    fontWeight: FontWeight.w700,
                    height: 1.67,
                    letterSpacing: -0.36,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'M/s KPMG Taseer Hadi & Co., Chartered\nAccountants M/s A.F. Ferguson & Co.,\nChartered Accountants',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        height: 1.75,
                        letterSpacing: -0.32,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
        Gap(12.r),
        Row(
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Website:',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.black,
                    fontSize: 18.r,
                    fontWeight: FontWeight.w700,
                    height: 1.67,
                    letterSpacing: -0.36,
                  ),
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'http://www.ogdcl.com',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          height: 1.75,
                          letterSpacing: -0.32,
                        ),
                        recognizer: TapGestureRecognizer()..onTap =(){
                          launch('http://www.ogdcl.com');
                        }
                      ),

                    )
                  ],
                )
              ],
            )
          ],
        ),
        Gap(12.r),
        Row(
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address:',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.black,
                    fontSize: 18.r,
                    fontWeight: FontWeight.w700,
                    height: 1.67,
                    letterSpacing: -0.36,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'OGDCL House, Plot No 3, F-6/G-6, Blue Area,\nJinnah Avenue, Islamabad',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        height: 1.75,
                        letterSpacing: -0.32,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  _executiveName(BuildContext context, CompanyViewModel value) {
    return Column(
      children: [
        Container(
          height: 45.r,
          decoration: ShapeDecoration(
            color: Color(0xFF1C1C1C),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFFE5E2E1)),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
          ),
          child: Row(
            children: [
              Gap(15.r),
              Expanded(
                child: Text(
                  'Executive Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 2.15,
                    letterSpacing: -0.14,
                  ),
                ),
              ),
        
              Expanded(
                child: Text(
                  'Designation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 2.15,
                    letterSpacing: -0.14,
                  ),
                ),
              ),
              Gap(15.r),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.r),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text(
                    'Mr. Shahid Salim Khan',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Color(0xFF1C1C1C),
                      fontWeight: FontWeight.w500,
                      height: 2.15,
                      letterSpacing: -0.28,
                    ),
                  )
                  ),
                  Expanded(
                      child: Text(
                        'CEO',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Color(0xFF1C1C1C),
                          fontWeight: FontWeight.w500,
                          height: 2.15,
                          letterSpacing: -0.28,
                        ),
                      )
                  ),
                ],
              ),
              Divider(
                thickness: 1.r,
                color: Color(0xFFE5E2E1),
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                        'Mr. Shahid Salim Khan',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Color(0xFF1C1C1C),
                          fontWeight: FontWeight.w500,
                          height: 2.15,
                          letterSpacing: -0.28,
                        ),
                      )
                  ),
                  Expanded(
                      child: Text(
                        'CEO',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Color(0xFF1C1C1C),
                          fontWeight: FontWeight.w500,
                          height: 2.15,
                          letterSpacing: -0.28,
                        ),
                      )
                  ),
                ],
              ),
              Divider(
                thickness: 1.r,
                color: Color(0xFFE5E2E1),
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                        'Mr. Shahid Salim Khan',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Color(0xFF1C1C1C),
                          fontWeight: FontWeight.w500,
                          height: 2.15,
                          letterSpacing: -0.28,
                        ),
                      )
                  ),
                  Expanded(
                      child: Text(
                        'CEO',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Color(0xFF1C1C1C),
                          fontWeight: FontWeight.w500,
                          height: 2.15,
                          letterSpacing: -0.28,
                        ),
                      )
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
