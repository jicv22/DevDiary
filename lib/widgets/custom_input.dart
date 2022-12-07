import 'package:dev_diary/utils/color_palette.dart';
import 'package:dev_diary/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget{
  CustomInput(
    this.type,
    {
      super.key
    }
  );
  String type = 'TextFormField';

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(label: 'Email');
  }
}