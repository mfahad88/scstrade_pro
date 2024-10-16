import 'package:flutter/material.dart';
import 'package:scstrade_pro/data/dto/kse_indices.dart';

import '../helper/Utils.dart';


class CardIndex extends StatelessWidget {
  final KseIndices kse_indices;
  const CardIndex(this.kse_indices);

  @override
  Widget build(BuildContext context) {
    return  Card.outlined(

      elevation: 5.0,
      child: SizedBox(
        width: 120,
        child: Column(
          children: [
            const SizedBox(height: 4,),
            Text('${kse_indices.indexCode}',
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500
            ),),
            Text(Utils.commaSeparated(double.parse(kse_indices.currentIndex??"0")),
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500
              ),),
            Text('${Utils.roundTwoDecimal(double.parse(kse_indices.currentIndex!))}(${Utils.roundTwoDecimal((double.parse(kse_indices.netChange!)/kse_indices.preClose!.toDouble())*100)}%)',
              style: TextStyle(
                  fontSize: 10,
                color: kse_indices.currentIndex!.contains('-')?Colors.red.shade700:Colors.greenAccent.shade700
              ),),
          ],
        ),
      ),
    );
  }
}
