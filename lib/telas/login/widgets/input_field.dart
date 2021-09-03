import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData icon;
  final String validateText;
  final bool autoFocus;
  final TextEditingController controller;


  InputField({@required this.hint,@required  this.obscure,@required  this.icon,@required  this.controller,@required  this.validateText, @required this.autoFocus});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.white24,
        width: 0.5,
      ))),
      child: TextFormField(
        // ignore: missing_return
        validator: (value) {
          if(value.isEmpty){
            return validateText;
          }
        },
        autofocus: autoFocus,
        controller: controller,
        obscureText: obscure,
        style: TextStyle(color: Colors.black38),
        keyboardType: TextInputType.number,

        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Colors.black38,
              size: 28,
            ),
            //border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.w400,
                fontSize: 20,
                letterSpacing: 0.9,
                fontFamily: "Tahoma"),
            contentPadding:
                EdgeInsets.only(top: 30, right: 30, bottom: 30, left: 5)),
      ),
    );
  }
}
