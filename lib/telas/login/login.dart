import 'package:fairhouseexpositor/stores/login_store.dart';
import 'package:fairhouseexpositor/telas/base/base_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  TextEditingController _controllerUser = TextEditingController();
  TextEditingController _controllerPass = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  bool _obscureText = true;
  LoginStore loginStore = GetIt.I<LoginStore>();

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => BaseScreen()));
      }
    });
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  Widget _loginBtn() {
    return Container(
      width: !loginStore.loading ? double.infinity : 90,
      margin: EdgeInsets.only(top: 20, bottom: 30),
      decoration: BoxDecoration(
        color: Color.fromRGBO(63, 81, 181, 1.0),
        borderRadius: BorderRadius.all(Radius.circular(50)),
        boxShadow: loginStore.loginPressed == null
            ? null
            : [
                BoxShadow(
                  color: Color.fromRGBO(63, 81, 181, 1.0),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                  spreadRadius: 0,
                ),
              ],
      ),
      child: ElevatedButton(
        onPressed: loginStore.loginPressed == null
            ? () => EasyLoading.showInfo("Informe todos os campos!")
            : () => {
                  loginStore.loginPressed!().then(
                    (login) {
                      if (login) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => BaseScreen(),
                          ),
                        );
                      }
                    },
                  )
                },
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
            (Set<MaterialState> states) {
              return EdgeInsets.all(25);
            },
          ),
          shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
            (Set<MaterialState> states) {
              return RoundedRectangleBorder(
                borderRadius: !loginStore.loading
                    ? BorderRadius.all(Radius.circular(38.0))
                    : BorderRadius.all(Radius.circular(50.0)),
              );
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (loginStore.loginPressed == null)
                return Color.fromRGBO(2, 182, 254, 0.5);
              else
                return Color.fromRGBO(63, 81, 181, 1.0);
            },
          ),
        ),
        child: loginStore.loading
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : Text(
                "ENTRAR",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: 3,
                  fontFamily: "WorkSansMedium",
                ),
              ),
      ),
    );
  }

  Widget _inputField({
    required Icon prefixIcon,
    required String hintText,
    required bool isPassword,
    required bool enabled,
    required Function(String) onChanged,
    required TextInputType keyboardType,
    String? errorText,
    List<TextInputFormatter>? inputFormatters,
    Widget? suffixIcon,
    String? initialValue,
    TextEditingController? controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 25,
              offset: Offset(0, 5),
              spreadRadius: -25,
            ),
          ],
        ),
        margin: EdgeInsets.only(bottom: 20),
        child: TextFormField(
          controller: controller,
          initialValue: initialValue,
          obscureText: isPassword,
          keyboardType: keyboardType,
          onChanged: onChanged,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Color(0xff000912),
          ),
          decoration: InputDecoration(
            errorText: errorText,
            contentPadding: EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 5,
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color(0xffA6B0BD),
            ),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            prefixIconConstraints: BoxConstraints(
              minWidth: 65,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          inputFormatters: inputFormatters,
        ),
      ),
    );
  }

  Widget _logo(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50, bottom: 10),
      height: MediaQuery.of(context).size.height * 0.35,
      child: Image.asset("imagens/logoGeniusPro.png"),
    );
  }

  void _toggleText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Column(
            children: [
              _logo(context),
              _inputField(
                initialValue: loginStore.usuario,
                enabled: !loginStore.loading,
                errorText: loginStore.usuarioError,
                hintText: "CNPJ",
                isPassword: false,
                keyboardType: TextInputType.number,
                onChanged: loginStore.setUsuario,
                prefixIcon: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.black87,
                ),
              ),
              _inputField(
                enabled: !loginStore.loading,
                errorText: loginStore.senhaError,
                hintText: "Senha",
                isPassword: _obscureText,
                keyboardType: TextInputType.text,
                onChanged: loginStore.setSenha,
                prefixIcon: Icon(
                  Icons.lock_outline,
                  size: 30,
                  color: Colors.black87,
                ),
                suffixIcon: GestureDetector(
                  onTap: _toggleText,
                  child: Icon(
                    _obscureText
                        ? FontAwesomeIcons.eye
                        : FontAwesomeIcons.eyeSlash,
                    size: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
              _loginBtn(),
            ],
          ),
        ),
      ),
    );
  }
}
