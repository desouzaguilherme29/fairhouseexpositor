import 'dart:convert';
import 'dart:io';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/url_service.dart';
import 'package:http/http.dart' as http;

Future<bool> chamarWhats({required String text, required String number}) async {
  var whatsapp = "55" +
      number
          .replaceAll(' ', '')
          .replaceAll('-', '')
          .replaceAll(')', '')
          .replaceAll('(', '')
          .trim();
  var whatsappURlAndroid = "whatsapp://send?phone=+" + whatsapp + "&text=$text";
  var whatsappURLIos = "https://wa.me/$whatsapp?text=$text";
  print(whatsappURLIos);
  if (Platform.isIOS) {
    if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
      await launchUrl(Uri.parse(
        whatsappURlAndroid,
      ));
      return true;
    } else {
      //EasyLoading.showInfo("Whatsapp não instalado!");
      return false;
    }
  } else {
    if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
      await launchUrl(Uri.parse(whatsappURlAndroid));
      return true;
    } else {
      //EasyLoading.showInfo("Whatsapp não instalado!");
      return false;
    }
  }
}

Future solicitarRelatorio(BuildContext context) async {
  http.Response response;
  Uri url;
  url = getUrlEnvioRelatorio();
  response = await http.post(url);

  if (response.statusCode == 200) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      text:
          "Todos os visitantes foram enviados, verifique o de e-mail informado no cadastro do expositor.",
      title: "Solicitação bem sucedida!",
    );
  } else if (response.statusCode == 500) {
    var value = json.decode(response.body);
    CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "Ops, algo deu errado!",
        text: value["message"]);
  } else {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "Servidor inacessível",
        text: "Tente novamente");
  }
}
