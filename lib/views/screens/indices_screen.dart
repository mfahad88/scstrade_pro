import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/models/indices/IndicesSummary.dart';
import 'package:scstrade_pro/models/response/api_response.dart';
import 'package:scstrade_pro/theme/theme.dart';
import 'package:scstrade_pro/viewmodels/indices_viewmodel.dart';
import 'package:scstrade_pro/viewmodels/main_viewmodel.dart';
import 'package:scstrade_pro/views/screens/stock_index_screen.dart';
import 'package:scstrade_pro/views/widgets/m_indice_card.dart';
import 'package:scstrade_pro/views/widgets/m_market_status.dart';
import 'package:scstrade_pro/views/widgets/m_rounded_container.dart';

class IndicesScreen extends StatelessWidget {
  const IndicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Utils.isDark(context)?Colors.black:Colors.white,
        body: SafeArea(
          child: Consumer<IndicesViewModel>(
              builder: (_,value,child) {
                return Container(
          
                  margin: EdgeInsets.symmetric(horizontal: 10.r),
                  child: _indicesList(context,value),
                );
              }
          ),
        ),
      ),
    );
  }

  _indicesList(BuildContext context,IndicesViewModel value) {

    switch(value.apiResponse.status) {
      case null:

      case Status.loading:
        return const Center(child: CircularProgressIndicator(),);
      case Status.completed:
        return ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // context.read<MainViewModel>().selectedMenu='StockIndexScreen';
                  // context.read<MainViewModel>().selectedIndex= (value.apiResponse.data![index] as IndicesSummary).indexcode??'';
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => StockIndexScreen(index: (value.apiResponse.data![index] as IndicesSummary).indexcode.toString()),));
                },
                child: Container(
                  clipBehavior: Clip.none,
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.0.r,
                      vertical: 12.0.r
                  ),
                  decoration: ShapeDecoration(

                    color: Utils.isDark(context)?Color(0xFF1C1B1B):Color(0xFFFCF8F8),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Utils.isDark(context)? Color(0xFF313030):Color(0xFFF4F0EF)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: mIndicesCard(
                      context: context,
                      indicesSummary: value.apiResponse.data![index]),
                ),
              );

            },
            separatorBuilder: (context, index) => Gap(10.r),
            itemCount: value.apiResponse.data?.length??0);
      case Status.error:
        return Center(child: Text(value.apiResponse.message??""));
    }

  }
}
