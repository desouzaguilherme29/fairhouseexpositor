import 'package:flutter/material.dart';

Widget customElevatedButton(BuildContext context, String text,
    Color activeColor, Color disabledColor, void Function()? onPressed) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed))
            return activeColor;
          else if (states.contains(MaterialState.disabled))
            return disabledColor;
          else
            return activeColor;
        },
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        color: Colors.white,
        fontFamily: "WorkSansMedium",
      ),
    ),
    onPressed: onPressed,
  );
}
