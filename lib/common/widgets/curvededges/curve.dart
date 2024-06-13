import 'package:ecommerce/common/widgets/curvededges/curvededge.dart';
import 'package:flutter/material.dart';

class tcurve extends StatelessWidget {
  const tcurve( {
    super.key,
    this.child,
  });
  final Widget? child;


  @override
  Widget build(BuildContext context) {
    return ClipPath(
    clipper: TCurvedEdges(),
      child:child,
    );
  }
}
