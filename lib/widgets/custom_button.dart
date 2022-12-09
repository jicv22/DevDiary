import 'package:dev_diary/Widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{ // si se agrega un icono puede que la altura cambie. Corregir eso.
  CustomButton(
    {
      this.icon,
      required this.heroTag,
      this.text = '',
      this.onTap,
      this.color,
      this.backgroundColor,
      super.key
    }
  );

  Color? backgroundColor, color;
  String text;
  Icon? icon;
  VoidCallback? onTap;
  String heroTag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: heroTag,
      label: Text(
        text,
        style: TextStyle(
          color: color,
        ),
      ),
      backgroundColor: backgroundColor,
      icon: icon,
      onPressed: onTap,
      elevation: 0,
      highlightElevation: 3,
    );
  }

}