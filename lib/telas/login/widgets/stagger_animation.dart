import 'dart:async';
import 'dart:convert';
import 'package:fairhouseexpositor/models/Usuario.dart';
import 'package:fairhouseexpositor/models/url_service.dart';
import 'package:fairhouseexpositor/stores/resumo_stand.dart';
import 'package:fairhouseexpositor/stores/user_manager_store.dart';
import 'package:fairhouseexpositor/stores/visitante_stand.dart';
import 'package:fairhouseexpositor/stores/visitantes_feira.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  final TextEditingController controllerUser;
  final TextEditingController controllerPass;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  StaggerAnimation(
      {@required this.controller,
      @required this.controllerUser,
      @required this.controllerPass,
      @required this.formKey,
      @required this.scaffoldkey})
      : buttonSqueeze = Tween(begin: 320.0, end: 60.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.150),
          ),
        ),
        buttonZoomOut = Tween(
          begin: 60.0,
          end: 1000.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.5,
              1,
              curve: Curves.bounceOut,
            ),
          ),
        );

  final Animation<double> buttonSqueeze;
  final Animation<double> buttonZoomOut;

  Widget _builderAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: InkWell(
        onTap: () {
          if (formKey.currentState.validate()) {
            _getDadosLogin(context);
          }
        },
        child: Hero(
          tag: "fade",
          child: buttonZoomOut.value == 60
              ? Container(
                  width: buttonSqueeze.value,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  child: _buildInside(context),
                )
              : Container(
                  width: buttonZoomOut.value,
                  height: buttonZoomOut.value,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      shape: buttonZoomOut.value < 500
                          ? BoxShape.circle
                          : BoxShape.rectangle),
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _builderAnimation,
      animation: controller,
    );
  }

  _buildInside(BuildContext context) {
    if (buttonSqueeze.value > 75) {
      return Text(
        "Entrar",
        style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.3),
      );
    } else {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 1.0,
      );
    }
  }

  Future _getDadosLogin(BuildContext context) async {
    FocusScope.of(context).requestFocus(new FocusNode());

    var url = getUrlLogin(controllerUser.text, controllerPass.text);

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var value = json.decode(response.body);
        if (value.toString().length > 2) {
          var resultUser = await Usuario.fromJson(value[0]);
          GetIt.I<UserManagerStore>().setUser(resultUser);
          GetIt.I<VisitanteStandStore>().loadVisitantes();
          GetIt.I<VisitantesFeira>().loadVisitantes();
          GetIt.I<ResumoStand>().loadResumo();

          controller.forward();
        }
      } else if (response.statusCode == 401) {
        scaffoldkey.currentState.showSnackBar(SnackBar(
          content: Text(
              "Usuário e/ou senha incorretos.\nVerifique e tente novamente.",
              textAlign: TextAlign.center),
        ));
      } else {
        scaffoldkey.currentState.showSnackBar(SnackBar(
          content: Text(
              "Sem conexão com o servidor! Status: ${response.statusCode}",
              textAlign: TextAlign.center),
        ));
      }
    } on Exception {
      scaffoldkey.currentState.showSnackBar(
        SnackBar(
          content: Text(
              "Problemas com o login, verifique usuário e senha e sua conexão com servidor.",
              textAlign: TextAlign.center),
        ),
      );
    }
  }
}
