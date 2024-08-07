import 'package:flutter/material.dart';

class ExpandableSearch extends StatefulWidget {
  final Function(String) onChanged;
  const ExpandableSearch({super.key,required this.onChanged});

  @override
  State<ExpandableSearch> createState() => _ExpandableSearchState();
}

class _ExpandableSearchState extends State<ExpandableSearch> {
  bool isExpanded = false;
  bool isIconClicked = false;
  @override
  Widget build(BuildContext context) {
    const animationDuration = Duration(milliseconds: 250);
    const opacityAnimationDuration = Duration(milliseconds: 150);
    return AnimatedContainer(
        height: 48,
        duration: animationDuration,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: isExpanded ? const Color(0xFF12D18E) : Colors.transparent,
            width: isExpanded ? 1 : 0,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTapDown: (_) {
                setState(() {
                  isIconClicked = true;
                });
              },
              onTapUp: (_) {
                setState(() {
                  isIconClicked = false;
                });
              },
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: AnimatedOpacity(
                duration: opacityAnimationDuration,
                opacity: isIconClicked ? 0.7 : 1,
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                  child: const Icon(Icons.search, color: Color(0xFF212121)),
                ),
              ),
            ),
            AnimatedContainer(
              duration: animationDuration,
              curve: Curves.easeInOut,
              width: isExpanded ? MediaQuery.of(context).size.width * 0.6 : 0,
              child: TextField(
                onChanged: widget.onChanged,
                onTapOutside: (_) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  setState(() {
                    isExpanded = false;
                    isIconClicked = false;
                  });
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Start typing to search',
                  hintStyle: TextStyle(color: Color(0xFF212121)),
                ),
              ),
            ),
          ],
        )
    );
  }
}
