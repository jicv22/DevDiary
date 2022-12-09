import 'package:dev_diary/Widgets/custom_text.dart';
import 'package:dev_diary/utils/color_palette.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField(
      {
        this.label = '',
        this.isPassword = false,
        this.validatorValue,
        this.updateTextValue,
        super.key
      }
      );

  String label;
  bool isPassword;
  Function(String?)? validatorValue;
  Function(String? value)? updateTextValue;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  String? error;
  bool isLabelVisible = false;
  double sideMargin = 30;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isLabelVisible == true ? Container(
            width: 1000,
            margin: EdgeInsets.symmetric(horizontal: sideMargin + 20),
            child: CustomText(
                widget.label,
                color: colorPalette['secondary-light']!,
                type: 't2',
                textAlign: TextAlign.start
            )
        ): const SizedBox(),
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
                error != null ? (colorPalette['error-dark'])! : (colorPalette['secondary-light'])!.withAlpha(50), // aun esta en veremos
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
              hintText: widget.label,
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
              try{
                setState(() {
                  error = widget.validatorValue!(value);
                });
                if(error != null) return '';
                return null;
              }catch(er){
                setState(() {
                  error = null;
                });
                return null;
              }
            },
            onChanged: (value){
              try{
                widget.updateTextValue!(value);
              }catch(er){
                debugPrint(er.toString());
              }
              if (value.isNotEmpty) {
                if(!isLabelVisible){
                  setState(() => {
                    isLabelVisible = true
                  });
                }
              }else{
                setState(() => {
                  isLabelVisible = false
                });
              }
            },
          ),
        ),
        const SizedBox(height: 5,),
        error != null  ? Container(
            width: 1000,
            margin: EdgeInsets.symmetric(horizontal: sideMargin + 20),
            child: CustomText(
                error!,
                color: colorPalette['error-light']!,
                type: 't2',
                textAlign: TextAlign.start
            )
        ) : const SizedBox(),
      ],
    );
  }
}