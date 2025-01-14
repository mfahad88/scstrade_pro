import 'package:flutter/material.dart';
import 'package:scstrade_pro/helper/Utils.dart';

import '../../theme/theme.dart';

class mTabbar extends StatelessWidget {
  final TabController controller;
  final List<String> tabs;
  final ValueChanged<int>? onTap;
  const mTabbar({super.key, required this.controller, required this.tabs, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      tabs: tabs.map((e) => Tab(text: e,),).toList(),
      enableFeedback: true,
      isScrollable: true,

      indicatorColor: Utils.isDark(context)?MaterialTheme.lightScheme().secondaryFixedDim:MaterialTheme.lightScheme().primary,
      labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.w500,
          height: 1.43,
          letterSpacing: 0.12,
          color: Utils.isDark(context)?Colors.white: const Color(0xFF1C1B1B)
      ),
      onTap: onTap,
    );
  }
}
