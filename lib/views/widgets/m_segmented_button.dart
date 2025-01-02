import 'package:flutter/material.dart';

class mSegmentedButton<T> extends StatelessWidget {
  final List<ButtonSegment<T>> segments;
  final Set<T> selected;
  final void Function(Set<T>)? onSelectionChanged;
  const mSegmentedButton({super.key, required this.segments, required this.selected, this.onSelectionChanged});

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
        
        segments: segments,
        selected: selected,
    onSelectionChanged:onSelectionChanged,);
  }
}
