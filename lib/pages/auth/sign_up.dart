import 'package:dev_diary/Widgets/custom_text.dart';
import 'package:dev_diary/utils/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPalette['primary-dark'],
      body: Center(
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            CustomText(
              'Sign Up Page',
              color: colorPalette['primary-light']!,
              type: 'h1',
              textAlign: TextAlign.center,
              isUnderline: true,
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