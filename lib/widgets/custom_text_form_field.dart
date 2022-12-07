import 'package:dev_diary/Widgets/custom_text.dart';
import 'package:dev_diary/utils/color_palette.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField(
      {
        this.text = '',
        this.error = '',
        this.label = '',
        this.isPassword = false,
        super.key
      }
      );

  String text, label, error;
  bool isPassword;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  bool isLabelVisible = false;
  bool isFormInvalid = false;
  double sideMargin = 30;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 1000,
            margin: EdgeInsets.symmetric(horizontal: sideMargin + 20),
            child: CustomText(
                isLabelVisible == true ? widget.label : '',
                color: colorPalette['secondary-light']!,
                type: 't2',
                textAlign: TextAlign.start
            )
        ),
        const SizedBox(height: 5,),
        Container(
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: sideMargin),
          padding: const EdgeInsets.only(left: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                (colorPalette['primary-dark-shadow'])!,
                (colorPalette['primary-dark-shadow'])!.withAlpha(200),
                (colorPalette['primary-dark-shadow'])!.withAlpha(100),
                (colorPalette['primary-dark-shadow'])!.withAlpha(50),
                (colorPalette['primary-dark-shadow'])!.withAlpha(25),
                (colorPalette['primary-dark'])!,
                (colorPalette['primary-dark'])!.withAlpha(0),
                (colorPalette['primary-dark'])!.withAlpha(0),
                (colorPalette['primary-dark'])!.withAlpha(0),
                isFormInvalid ? (colorPalette['error-dark'])! : (colorPalette['secondary-light'])!.withAlpha(50), // aun esta en veremos
              ],
            ),
          ),
          child: TextFormField(
            obscureText: widget.isPassword,
            enableSuggestions: !widget.isPassword,
            autocorrect: !widget.isPassword,
            style: TextStyle(
              color: colorPalette['primary-light'],
            ),
            decoration: InputDecoration(
              hintText: widget.label, // HACER QUE SE MUESTRE NU LABEL FALSO CON ANIMACION CUANDO SE ESCRIBA YA HAYA CONTENIDO EN EL TEXTFORMFIELD
              hintStyle: TextStyle(
                color: colorPalette['secondary-light'],
              ),
              errorStyle: const TextStyle(height: 0),
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: (colorPalette['secondary-light'])!
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                setState(() {
                  isFormInvalid = true;
                });
                return '';
              }
              setState(() {
                isFormInvalid = false;
              });
              return null;
            },
            onChanged: (value) => {
              if (value.isNotEmpty) {
                if(!isLabelVisible){
                  setState(() => {
                    isLabelVisible = true
                  })
                }
              }else{
                setState(() => {
                  isLabelVisible = false
                })
              }
            },
          ),
        ),
        const SizedBox(height: 5,),
        Container(
            width: 1000,
            margin: EdgeInsets.symmetric(horizontal: sideMargin + 20),
            child: CustomText(
                isFormInvalid == true ? widget.error : '',
                color: colorPalette['error-light']!,
                type: 't2',
                textAlign: TextAlign.start
            )
        ),
      ],
    );
  }
}