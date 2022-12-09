import 'package:dev_diary/Widgets/custom_text.dart';
import 'package:dev_diary/pages/auth/pass_recover.dart';
import 'package:dev_diary/pages/auth/sign_up.dart';
import 'package:dev_diary/utils/color_palette.dart';
import 'package:dev_diary/widgets/custom_text_form_field.dart';
import 'package:dev_diary/widgets/custom_button.dart';
import 'package:dev_diary/widgets/custom_checkbox.dart';
import 'package:dev_diary/widgets/custom_form.dart';
import 'package:flutter/material.dart';


class Login extends StatelessWidget{

  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
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
            const SizedBox(
              height: 30,
            ),
            Center(
                child: CustomText(
                  'DevDiary',
                  color: (colorPalette['primary-light'])!,
                  type: 'xh1',
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                )
            ),
            const SizedBox(
              height: 40,
            ),
            CustomForm(
              formKey: formKey,
              formActionDistance: 35,
              form: [
                CustomTextFormField(
                  controller: email,
                  label: 'Email',
                  validatorValue: (String? value){
                    if(value == null || value.isEmpty) return 'Type a valid email';
                    return null;
                  }
                ) ,
                const SizedBox(height: 10,),
                CustomTextFormField(
                  controller: password,
                  label: 'Password',
                  isPassword: true,
                  validatorValue: (String? value){
                    if(value == null || value.isEmpty) return 'Type a valid password';
                    return null;
                  }
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomCheckbox(),
                      CustomText(
                        'I forgot my password',
                        isUnderline: true,
                        type: 't2',
                        color: (colorPalette['secondary-light'])!,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PassRecover()));
                        },
                      )
                    ],
                  ),
                )
              ],
              actions: [
                Expanded(
                    child: CustomButton(
                      heroTag: 'signUp',
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      icon: Icon(
                        Icons.person_add,
                        color: colorPalette['primary-light'],
                        size: 25,
                      ),
                      backgroundColor: (colorPalette['secondary-dark'])!,
                      color: (colorPalette['primary-light'])!,
                    )
                ),
                const SizedBox(width: 25),
                Expanded(
                    child: CustomButton(
                      heroTag: 'signIn',
                      icon: Icon(
                        Icons.login,
                        color: colorPalette['primary-light'],
                        size: 30,
                      ),
                      backgroundColor: (colorPalette['secondary-dark'])!,
                      color: (colorPalette['primary-light'])!,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          debugPrint(email.text);
                          debugPrint(password.text);
                        }
                      },
                    )
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(child: Divider(color: (colorPalette['primary-light'])!, thickness: .6,)),
                    const SizedBox(width: 20,),
                    CustomText(
                      'o',
                      color: (colorPalette['primary-light'])!,
                      type: 't2',
                    ),
                    const SizedBox(width: 20,),
                    Expanded(child: Divider(color: (colorPalette['primary-light'])!, thickness: .6,)),
                  ],
                )
            ),
            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.phone,), // bucsar logo de Google (tal vez)
                    iconSize: 50,
                    color: (colorPalette['primary-light'])!
                ),
                const SizedBox(width: 50,),
                IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.add_task_outlined,), // bucsar logo de Facebook (tal vez)
                    iconSize: 50,
                    color: (colorPalette['primary-light'])!
                ),
              ],
            )
          ],
        )
    );
  }
}