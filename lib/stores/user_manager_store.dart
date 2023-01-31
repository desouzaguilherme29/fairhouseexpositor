import 'package:fairhouseexpositor/models/Usuario.dart';
import 'package:fairhouseexpositor/models/keys_constantes.dart';
import 'package:fairhouseexpositor/repositorios/usuario_repositorio.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_manager_store.g.dart';

class UserManagerStore = _UserManagerStore with _$UserManagerStore;

abstract class _UserManagerStore with Store {
  _UserManagerStore() {
    _getUsuarioConectado();
  }

  @observable
  Usuario? user;

  @computed
  bool get isLoggedIn => user != null;

  @action
  setUser(Usuario? value) async {
    user = value;

    if (isLoggedIn) {
      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;

      prefs.setInt(key_codigo_expositor, user!.id!);
      prefs.setString(key_nome_expositor, user!.nome!);
      prefs.setString(key_razao_expositor, user!.razaosocial!);
      prefs.setString(key_cidade_expositor, user!.cidade!);
      prefs.setString(key_cnpj_expositor, user!.cnpj!);
    }
  }

  @action
  logoutUser() async {
    setUser(null);

    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    prefs.remove(key_codigo_expositor);
    prefs.remove(key_nome_expositor);
    prefs.remove(key_razao_expositor);
    prefs.remove(key_cidade_expositor);
    prefs.remove(key_cnpj_expositor);
  }

  Future<void> _getUsuarioConectado() async {
    final user = await UsuarioRepositorio().UsuarioAtual();
    setUser(user);
  }
}
