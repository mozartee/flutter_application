import 'package:flutter/material.dart';

class OSTAppBar extends AppBar {
  OSTAppBar({super.key, this.leading});

  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
    );
  }
}
