import 'package:flutter/material.dart';

class Tcircular extends StatelessWidget {
  const Tcircular({
    super.key,
    this.child,
    this.width=400,
    this.height=400,
    this.radius=400,
    this.padding=0,
   this.backgroundColor = Colors.white,
  });

   final double? width; // ? to make variable nullable. ? tells that you can give null value to variabe.
   final double? height;
   final double radius;
   final double padding;
   final Widget? child;
   final Color backgroundColor;


  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor,
        ),
        child: child,
        );
  }
}
