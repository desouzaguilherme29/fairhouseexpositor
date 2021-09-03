import 'package:fairhouseexpositor/telas/base/base_screen.dart';
import 'package:fairhouseexpositor/telas/login/widgets/form_container.dart';
import 'package:fairhouseexpositor/telas/login/widgets/signupbottom.dart';
import 'package:fairhouseexpositor/telas/login/widgets/stagger_animation.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  TextEditingController _controllerUser = TextEditingController();
  TextEditingController _controllerPass = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => BaseScreen()));
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Container(
        decoration: BoxDecoration(
            color: Colors.black45),
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 80, left: 15, right: 15),
                  height: 260,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 2.0,
                          spreadRadius: 2.0,
                          offset: Offset(
                            2.0, // horizontal, move right 10
                            2.0, // vertical, move down 10
                          ),
                        )
                      ]),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 50, bottom: 32),
                      child: Image.asset(
                        "imagens/logo_fairhouse.png",
                        width: 600,
                        height: 250,
                        fit: BoxFit.contain,
                      ),
                    ),
                    FormContainer(
                      controllerUser: _controllerUser,
                      controllerPass: _controllerPass,
                      formKey: _formKey,
                    ),
                    SignUpButton()
                  ],
                ),
                StaggerAnimation(
                  controller: _animationController.view,
                  controllerUser: _controllerUser,
                  controllerPass: _controllerPass,
                  formKey: _formKey,
                  scaffoldkey: _scaffoldkey,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
