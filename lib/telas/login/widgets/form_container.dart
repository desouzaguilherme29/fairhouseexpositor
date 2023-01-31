import 'package:fairhouseexpositor/telas/login/widgets/input_field.dart';
import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  TextEditingController? controllerUser;
  TextEditingController? controllerPass;
  GlobalKey<FormState>? formKey = GlobalKey<FormState>();

  FormContainer(
      {@required this.controllerUser,
      @required this.controllerPass,
      @required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            InputField(
              hint: "Usuário",
              obscure: false,
              icon: Icons.person_outline,
              controller: controllerUser!,
              validateText: "Insira o Usuário",
              autoFocus: false,
            ),
            InputField(
              hint: "Senha",
              obscure: true,
              icon: Icons.lock_outline,
              controller: controllerPass!,
              validateText: "Insira sua Senha",
              autoFocus: false,
            )
          ],
        ),
      ),
    );
  }
}
