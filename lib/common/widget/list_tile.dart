import 'package:flutter/material.dart';

class OSTListTile extends StatelessWidget {
  const OSTListTile({
    Key? key,
    this.text,
    this.leading,
    this.title,
    this.trailing = const Icon(Icons.keyboard_arrow_right),
    this.onTap,
  }) : super(key: key);

  final String? text;
  final Widget? leading;
  final Widget? title;
  final Widget? trailing;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: text != null ? Text(text!) : title,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
