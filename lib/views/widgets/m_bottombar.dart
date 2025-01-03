import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../helper/Utils.dart';

class mBottombar extends StatelessWidget {
  final Map menus;
  final Size size;
  final String selectedMenu;
  final Function(String) onTap;
  const mBottombar({super.key, required this.menus, required this.size, required this.selectedMenu, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.r,
      // margin: EdgeInsets.only(bottom: 10.r),
      decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(image: AssetImage('images/group_17.png'),fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Material(
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: menus.entries.map((e) {
            return GestureDetector(
              onTap: () => onTap(e.key),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  e.key.toLowerCase()==selectedMenu.toLowerCase()?Container(
                    width: Utils.percentToPx(percent: 17, size: size),
                    height: Utils.percentToPx(percent: 7.5, size: size,isWidth: false),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ):SizedBox(
                    width: Utils.percentToPx(percent: 17, size: size),
                    height: Utils.percentToPx(percent: 7.5, size: size,isWidth: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(e.value,
                          color: Colors.white,
                          fit: BoxFit.contain,
                          width: 24,
                          height: 23,
                        ),
                        Gap(4),
                        Text(e.key,
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Colors.white
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },).toList(),
        ),
      ),
    );
  }
}
