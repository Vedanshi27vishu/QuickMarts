import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ColorCircle extends StatelessWidget {
  const ColorCircle(
      {super.key, required this.text, required this.selected, this.onSelected});

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: THelperFunctions.getColor(text) != null
          ? const SizedBox()
          : const Text(''),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? Colors.white : null),
      avatar: THelperFunctions.getColor(text) != null
          ? Container(
              width: 50,
              height: 50,
              decoration:
                  BoxDecoration(color: THelperFunctions.getColor(text)!))
          : null,
      shape:
          THelperFunctions.getColor(text) != null ? const CircleBorder() : null,
      labelPadding: THelperFunctions.getColor(text) != null
          ? const EdgeInsets.all(0)
          : null,
      padding: THelperFunctions.getColor(text) != null
          ? const EdgeInsets.all(0)
          : null,
      backgroundColor: THelperFunctions.getColor(text) != null
          ? THelperFunctions.getColor(text)!
          : null,
    );
  }
}
