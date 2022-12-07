
import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget{
  CustomForm(
    {
      this.noSubmitBtn = false,
      this.noCancelBtn = false,
      this.faActions = 0,
      this.actions = const [],
      this.inputs = const [],
      this.postSubmit,
      this.onCancel,
      this.formKey,
      super.key
    }
  );

  double faActions;
  List<Widget> inputs;
  List<Widget> actions;
  bool noSubmitBtn, noCancelBtn;
  VoidCallback? postSubmit;
  VoidCallback? onCancel;
  GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    List<Widget> formChildren = [];

    inputs.forEach((e) {
      formChildren.add(e);
    });

    formChildren.add(
      SizedBox(height: faActions,)
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