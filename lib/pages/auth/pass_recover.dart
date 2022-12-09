import 'package:dev_diary/Widgets/custom_text.dart';
import 'package:dev_diary/utils/color_palette.dart';
import 'package:dev_diary/widgets/custom_button.dart';
import 'package:dev_diary/widgets/custom_form.dart';
import 'package:dev_diary/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PassRecover extends StatelessWidget{
  const PassRecover({super.key});


  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState>? formKey = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();

    return Scaffold(
      backgroundColor: colorPalette['primary-dark'],
      body: Center(
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            Center(
                child: CustomText(
                  'Logo Here\nInstead the name',
                  color: (colorPalette['primary-light'])!,
                  type: 'h4',
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                )
            ),
            const SizedBox(height: 30,),
            Center(
                child: CustomText(
                  'DevDiary',
                  color: (colorPalette['primary-light'])!,
                  type: 'xh1',
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                )
            ),
            const SizedBox(height: 40,),
            CustomForm(
              formKey: formKey,
              formActionDistance: 35,
              form: [
                CustomTextFormField(
                  controller: email,
                  label: 'Email',
                  validatorValue: (String? value){
                    if(value == null || value.isEmpty) return 'Enter a valid email';
                    return null;
                  },
                ),
                const SizedBox(height: 10,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info,
                        color: colorPalette['primary-light'],
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: CustomText(
                          'Write your account’s email and we’ll send you a code to allow you to change the password',
                          overflow: TextOverflow.fade,
                          type: 't3',
                          color: colorPalette['primary-light']!,
                        ),
                      ),
                    ],
                  ),
                )
              ],
              actions: [
                Expanded(
                  child: CustomButton(
                    heroTag: 'cancel',
                    text: 'Cancel',
                    color: colorPalette['primary-light'],
                    backgroundColor: colorPalette['error-dark'],
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(width: 25,),
                Expanded(
                  child: CustomButton(
                    heroTag: 'sendCode',
                    text: 'Send Code',
                    color: colorPalette['primary-light'],
                    backgroundColor: colorPalette['secondary-dark'],
                    onTap: (){
                      if(!formKey.currentState!.validate()) return;
                      debugPrint('*****************************Sending Code\n' + email.text);
                    },
                  ),
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}
/*
* si se llena bien el formulario
*   -Se redirigira a la pagina de Home
*   -Se remplazaran TODAS las rutas para que no se pueda viajar mas atras a no se que cierre sesion.
* */