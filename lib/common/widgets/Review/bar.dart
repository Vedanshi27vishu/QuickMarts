import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/utils/constants/colors.dart';

class BarReview extends StatelessWidget {
  const BarReview({
    super.key,
    required this.value,
    required this.percentage,
  });
  final String value;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            )),
        Expanded(
            flex: 11,
            child: SizedBox(
              width: THelperFunctions.screenWidth() * 0.8,
              child: LinearProgressIndicator(
                value: percentage,
                minHeight: 16,
                backgroundColor: Colors.grey,
                borderRadius: BorderRadius.circular(7),
                valueColor: const AlwaysStoppedAnimation(ecolor.primary),
              ),
            )),
      ],
    );
  }
}
