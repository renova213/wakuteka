import 'package:flutter/material.dart';

class DefaultIconButton extends StatelessWidget {
  final Function press;
  final Icon icon;
  const DefaultIconButton({super.key, required this.press, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: icon,
        ),
      ),
    );
  }
}
