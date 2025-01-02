import 'package:flutter/material.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/theme/theme.dart';

class mDropdown<T> extends StatelessWidget {
  final List dropdownMenuEntries;
  final ValueChanged<T?>? onSelected;
  final double? width;
  final T value;
  const mDropdown({super.key, required this.dropdownMenuEntries, required this.onSelected, this.width, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          width: 1,
          color: MaterialTheme.lightScheme().outline
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 8.0),
        child: DropdownButton<T>(
          isExpanded: true,
          style: Theme.of(context).textTheme.bodyLarge,
          underline: SizedBox.shrink(),
            borderRadius: BorderRadius.circular(10.0),
            value: value,
            items: dropdownMenuEntries.map((e) => DropdownMenuItem<T>(value: e,child: Text(e),),).toList(), onChanged: onSelected),
      ),
    );
    /*return DropdownMenu(
      width: width,
      dropdownMenuEntries: dropdownMenuEntries.map((e) => DropdownMenuEntry(label:e,value: e,),).toList(),onSelected: onSelected,);*/
  }
}
