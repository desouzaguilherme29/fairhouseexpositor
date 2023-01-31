import 'dart:convert';
import 'dart:ffi';
import 'package:fairhouseexpositor/models/url_service.dart';
import 'package:http/http.dart' as http;
import 'package:fairhouseexpositor/models/Usuario.dart';
import 'package:fairhouseexpositor/models/keys_constantes.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioRepositorio {
  Future<Usuario?> UsuarioAtual() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    if (!prefs.containsKey(key_codigo_expositor)) {
      return null;
    }

    if (prefs.getInt(key_codigo_expositor) != null &&
        prefs.getInt(key_codigo_expositor) != 0) {
      Usuario usuario = Usuario(
        id: prefs.getInt(key_codigo_expositor),
        nome: prefs.getString(key_nome_expositor),
        cnpj: prefs.getString(key_cnpj_expositor),
        cidade: prefs.getString(key_cidade_expositor),
        razaosocial: prefs.getString(key_razao_expositor),
      );

      return usuario;
    } else {
      return null;
    }
  }

  Future<Usuario?> Login(String? usuario, String? senha) async {
    var url = getUrlLogin(usuario, senha);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var value = json.decode(response.body);
      if (value.toString().length > 2) {
        var resultUser = await Usuario.fromJson(value[0]);
        return resultUser;
      }
    } else if (response.statusCode == 401) {
      EasyLoading.showError("Usuário ou Senha incorretos!");
      return Future.error("Usuário ou Senha incorretos!");
    } else {
      EasyLoading.showError(
          "Sem conexão com o servidor! Status: ${response.statusCode}");
      return Future.error(
          "Sem conexão com o servidor! Status: ${response.statusCode}");
    }
    return null;
  }
}
