import 'package:dev_diary/Widgets/custom_text.dart';
import 'package:dev_diary/utils/color_palette.dart';
import 'package:dev_diary/widgets/custom_button.dart';
import 'package:dev_diary/widgets/custom_form.dart';
import 'package:dev_diary/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget{
  const SignUp({super.key});


  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState>? formKey = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController description = TextEditingController();
    TextEditingController skill = TextEditingController();


    return Scaffold(
      backgroundColor: colorPalette['primary-dark'],
      body: Center(
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 25,),
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
                  CustomTextFormField(
                    controller: password,
                    label: 'Password',
                    isPassword: true,
                    validatorValue: (String? value){
                      if(value == null || value.isEmpty) return 'Enter a valid Password';
                      if(value.length < 8) return 'Enter more than 8 characters';
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  CustomTextFormField(
                    controller: name,
                    label: 'Name',
                    validatorValue: (String? value){
                      if(value == null || value.isEmpty) return 'Enter a valid Name';
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  CustomTextFormField(
                    controller: description,
                    label: 'Descripcion',
                  ),
                  const SizedBox(height: 10,),
                  CustomTextFormField(
                    controller: skill,
                    label: 'Skills',
                    validatorValue: (String? value){
                      if(value == null || value.isEmpty) return 'Enter a valid Skill';
                      return null;
                    },
                    onEditingComplete: (){
                      print('"${skill.text}" added');
                      skill.clear();
                    },
                  ),
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
                      heroTag: 'signUp',
                      text: 'Sign Up',
                      color: colorPalette['primary-light'],
                      backgroundColor: colorPalette['secondary-dark'],
                      onTap: (){
                        if(!formKey.currentState!.validate()) return;
                        debugPrint('Signing Up');
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25,),
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