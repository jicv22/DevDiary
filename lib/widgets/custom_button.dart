import 'package:dev_diary/Widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{ // si se agrega un icono puede que la altura cambie. Corregir eso.
  CustomButton(
    {
      this.icon,
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

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
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