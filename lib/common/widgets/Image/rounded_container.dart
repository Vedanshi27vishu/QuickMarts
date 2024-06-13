import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.showBorder=false,
    this.radius=ESizes.cardRadiusLg,
    this.backgroundColor= Colors.white,
    this.borderColor= ecolor.primary,
    });

  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color backgroundColor;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
   final EdgeInsetsGeometry? margin;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding:padding,
      margin:margin,
      decoration:BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder? Border.all(color: borderColor): null,
      )
    );
  }
}
