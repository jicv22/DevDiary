
import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget{
  CustomForm(
    {
      this.noSubmitBtn = false,
      this.noCancelBtn = false,
      this.formActionDistance = 0,
      this.actions = const [],
      this.form = const [],
      this.postSubmit,
      this.onCancel,
      this.formKey,
      super.key
    }
  );

  double formActionDistance;
  List<Widget> form;
  List<Widget> actions;
  bool noSubmitBtn, noCancelBtn;
  VoidCallback? postSubmit;
  VoidCallback? onCancel;
  GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    List<Widget> formChildren = [];

    form.forEach((e) {
      formChildren.add(e);
    });

    formChildren.add(
      SizedBox(height: formActionDistance,)
    );

    formChildren.add(
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: actions,
        ),
      )
    );

    return Form(
      key: formKey,
      child: Column(
        children: formChildren,
      ),
    );
  }
}