import 'package:fairhouseexpositor/models/Usuario.dart';
import 'package:fairhouseexpositor/models/keys_constantes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioRepositorio {
  Future<Usuario> UsuarioAtual() async {
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
}
