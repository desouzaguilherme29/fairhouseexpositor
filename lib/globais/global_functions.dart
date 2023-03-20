import 'dart:convert';
import 'dart:io';
import 'package:cool_alert/cool_alert.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<bool> chamarWhats({required String text, required String number}) async {
  var whatsapp = "55" +
      number
          .replaceAll(' ', '')
          .replaceAll('-', '')
          .replaceAll(')', '')
          .replaceAll('(', '')
          .trim();
  var whatsappURlAndroid = "whatsapp://send?phone=" + whatsapp + "&text=$text";
  var whatsappURLIos = "https://wa.me/$whatsapp?text=$text";
  print(whatsappURLIos);
  if (Platform.isIOS) {
    if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
      await launchUrl(Uri.parse(
        whatsappURlAndroid,
      ));
      return true;
    } else {
      EasyLoading.showInfo("Whatsapp não instalado!");
      return false;
    }
  } else {
    if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
      await launchUrl(Uri.parse(whatsappURlAndroid));
      return true;
    } else {
      EasyLoading.showInfo("Whatsapp não instalado!");
      return false;
    }
  }
}
