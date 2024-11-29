import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scstrade_pro/screens/companyProfile/ui/widget/ExpandedTile.dart';

import 'widget/RoundedContainer.dart';

class FundamentalScreen extends StatelessWidget {
  const FundamentalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expandedtile(title: 'Fundamentals',
            body: [
              RoundedContainer(text1: 'Text Here', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Text Here', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Text Here', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Text Here', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Text Here', text2: 'Add Text or Value'),
              Gap(4),
            ]
        ),
        Gap(8),
        Expandedtile(title: 'Technicals',
            body: [
              RoundedContainer(text1: 'Text Here', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Text Here', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Text Here', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Text Here', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Text Here', text2: 'Add Text or Value'),
              Gap(4),
            ]
        ),
        Gap(8),
        Expandedtile(title: 'Equity Valuation',
            body: [
              RoundedContainer(text1: 'Text Here', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Text Here', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Text Here', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Text Here', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Text Here', text2: 'Add Text or Value'),
              Gap(4),
            ]
        ),
        Gap(8),
        Expandedtile(title: 'Performance',
            body: [
              RoundedContainer(text1: 'Text Here', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Text Here', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Text Here', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Text Here', text2: 'Add Text or Value'),
              Gap(4),
              RoundedContainer(text1: 'Text Here', text2: 'Add Text or Value'),
              Gap(4),
            ]
        ),
        Gap(8),
      ],
    );
  }
}
