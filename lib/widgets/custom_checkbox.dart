import 'package:dev_diary/Widgets/custom_text.dart';
import 'package:dev_diary/utils/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox(
    {
      super.key
    }
  );

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          side: BorderSide(
            width: 1,
            color: (colorPalette['secondary-light'])!,
          ),
          checkColor: (colorPalette['primary-light'])!,
          fillColor: MaterialStateProperty.all((colorPalette['secondary-light'])!),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        CustomText(
          'Remember Me',
          type: 't2',
          color: (colorPalette[isChecked ? 'primary-light' : 'secondary-light'])!,
          onTap: (){
            setState(() {
              isChecked = !isChecked;
            });
          }
        )
      ],
    );
  }
}