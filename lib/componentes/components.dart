import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fairhouseexpositor/extensions/extensions.dart';
import '../globais/global_functions.dart';

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

Widget compEmptyList() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.sd_card_alert_outlined,
          color: Colors.white,
          size: 60,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Não há resultados",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: "WorkSansMedium",
          ),
        )
      ],
    ),
  );
}

Widget compErrorList(String? error) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.error_outline_outlined,
        color: Colors.white,
        size: 80,
      ),
      const SizedBox(
        height: 8,
      ),
      Text(
        "Ocorreu um erro! \n${error}",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: "WorkSansMedium",
        ),
      )
    ],
  );
}

Widget compLoadingList() {
  return Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.white),
    ),
  );
}

Widget compItemList(
    String? nome,
    String? fantasia,
    String? cidade,
    String? email,
    String? celular,
    String? celularformatado,
    String? nomeExpositor,
    String? tipo,
    bool stand,
    BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 8.0),
    margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7.0),
      color: tipo == "LOJISTA"
          ? Colors.green
          : tipo == "EXPOSITOR"
              ? Colors.redAccent
              : Colors.yellowAccent,
    ),
    child: Container(
      padding: EdgeInsets.only(left: 4, top: 5, bottom: 2,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              nome!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                fontFamily: "WorkSansMedium",
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              fantasia!,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "WorkSansMedium",
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              cidade!,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: "WorkSansMedium",
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.18,
                    child: GestureDetector(
                      onTap: () async {
                        chamarWhats(
                          number: celular!,
                          text: stand
                              ? "Muito Obrigado por Visitar nosso Stand, Nós da ${nomeExpositor!.toLowerCase().capitalizeFirstofEach} ficamos honrados com sua presença!"
                              : "Olá, Notei que Você esta visitando a FairHouse, Venha nos visitar no nosso stand! Att. ${nomeExpositor!.toLowerCase().capitalizeFirstofEach}.",
                        ).then((value) {
                          if (!value) {
                            EasyLoading.showInfo("Whatsapp não instalado!");
                          }
                        });
                      },
                      child: Icon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.green,
                        size: 30,
                        shadows: <Shadow>[
                          Shadow(color: Colors.green, blurRadius: 3.0)
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.63,
                child: Text(
                  email!,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "WorkSansMedium",
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.28,
                child: Text(
                  celularformatado!,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "WorkSansMedium",
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
