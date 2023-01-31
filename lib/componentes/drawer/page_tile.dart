import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highlighted;

  PageTile(
      {required this.label,
      required this.iconData,
      required this.onTap,
      required this.highlighted});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
            color: highlighted ? Colors.black : Colors.black.withAlpha(90),
            fontWeight: FontWeight.w700,
            fontFamily: "WorkSansMedium",
            fontSize: 16),
      ),
      leading: Icon(
        iconData,
        color: highlighted ? Colors.black : Colors.black.withAlpha(90),
      ),
      onTap: onTap,
    );
  }
}
