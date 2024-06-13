import 'package:flutter/material.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(40);
}
