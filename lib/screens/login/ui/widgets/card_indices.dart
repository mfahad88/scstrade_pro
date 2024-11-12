import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/screens/login/viewmodel/login_viewmodel.dart';
import 'package:scstrade_pro/widgets/drop_index.dart';

class CardIndices extends StatefulWidget {
  const CardIndices({super.key});

  @override
  State<CardIndices> createState() => _CardIndicesState();
}

class _CardIndicesState extends State<CardIndices> with SingleTickerProviderStateMixin {
  Animation? _animation;
  AnimationController? _animationController;
  double volume=0.0;
  @override
  void initState() {
    _animationController=AnimationController(vsync: this,duration: const Duration(seconds: 10));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, raints) {
        double screenWidth=raints.maxWidth;

        return Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth*0.0416),
            child: Consumer<LoginViewModel>(builder: (context, value, child) {
              _animation = Tween<double>(
                begin: double.parse(value.prev_indices?.where((element) => element.indexCode==value.selectedValue,).first.volumeTraded??'0.0'),
                end: double.parse(value.indices?.where((element) => element.indexCode==value.selectedValue,).first.volumeTraded??'0.0')
              ).animate(CurvedAnimation(parent: _animationController!, curve: Curves.easeOut));
              _animationController?.forward();
              return AnimatedBuilder(animation: _animationController!, builder: (context, child) {
                return Container(
                  height: screenWidth*200/480,
                  padding: EdgeInsets.all(screenWidth*0.033),
                  decoration: ShapeDecoration(
                    color: Utils.isDark(context)?Color(0xFF142117):Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Utils.isDark(context)?Color(0xFF333333):Color(0xFFE1E1E1)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Utils.isDark(context)?Color(0x3F000000):Color(0x14000000),
                        blurRadius: 34,
                        offset: Offset(0, 24),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: value.isLoading?const Center(child: CircularProgressIndicator(),):Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropIndex(value: value.selectedValue,
                            items: value.indices?.map((e) => e.indexCode,).toList()??List.empty(),
                            onChanged: (v) {
                              value.selectedValue=v;
                            },
                            style: TextStyle(
                              color: Utils.isDark(context)?Colors.white:Color(0xFF222230),
                              fontSize: screenWidth*0.025,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),),
                          Gap(screenWidth*0.0167),
                          Text(
                            'M.Vol: ${Utils.commaSeparated(/*value.indices?.where((element) => element.indexCode==value.selectedValue,).first.volumeTraded*/_animation?.value.toString())}',
                            style: TextStyle(
                              color: Utils.isDark(context)? Colors.white:const Color(0xFF222230),
                              fontSize: screenWidth*0.033,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          )
                        ],
                      ),
                      Row(

                        children: [
                          Icon(Icons.arrow_drop_up,color: Utils.isDark(context)?Color(0xFF2CE52F):Color(0xFF0B4702),),
                          Text(
                            '${Utils.commaSeparated(value.indices?.where((element) => element.indexCode==value.selectedValue,).first.currentIndex)}',
                            style: TextStyle(
                              color: Utils.isDark(context)?Colors.white:Color(0xFF222230),
                              fontSize: screenWidth*0.066,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      Gap(screenWidth*0.025),
                      Container(
                        width: screenWidth*0.297,
                        height: screenWidth*0.058,
                        decoration: ShapeDecoration(
                          color: Color(0xFF393A37),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.arrow_upward,color: Color(0xFF2CE52F),size: screenWidth*0.044,),
                            Text(
                              value.dailyPercentChange,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth*0.029,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            Gap(5),
                            Text(
                              value.dailyChange,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth*0.029,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },);
            },)
        );
      },

    );
  }
}

