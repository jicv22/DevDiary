import 'package:flutter/material.dart';

Map<String, double> fontSizes = {
  'xh1': 32,
  'xh2': 30,
  'xh3': 28,
  'xh4': 26,
  'h1': 24,
  'h2': 22,
  'h3': 20,
  'h4': 18,
  't1': 16,
  't2': 14,
  't3': 12,
  't4': 10,
};

class CustomText extends StatelessWidget{
  CustomText(
    this.text,
    {
      this.textAlignVertical = TextAlignVertical.center,
      this.textAlign = TextAlign.start,
      this.type = 'h1',
      this.fontWeight = FontWeight.normal,
      this.color = Colors.black,
      this.isUnderline = false,
      this.onTap,
      super.key
    }
  );
  String text = '';
  String type;
  FontWeight fontWeight;
  Color color;
  TextAlignVertical textAlignVertical; // not working by now
  TextAlign textAlign;
  bool isUnderline;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // Agregar Eventos onTapUp y Down para cambiar el color del texto solamente en caso de tener un evento onTap
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSizes[type],
          color: color,
          decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
        ),
      ),
    );
  }
}