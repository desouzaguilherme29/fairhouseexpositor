import 'package:fairhouseexpositor/models/Usuario.dart';
import 'package:fairhouseexpositor/repositorios/usuario_repositorio.dart';
import 'package:fairhouseexpositor/stores/user_manager_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String? usuario;

  @action
  void setUsuario(String value) {
    usuario = value;
  }

  @computed
  bool get usuarioValid => usuario != null;

  String? get usuarioError {
    if (usuario == null || usuarioValid) {
      return null;
    } else if (usuario != null && usuario!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Deve ter pelo menos 1 dígito.';
    }
  }

  @observable
  String? senha;

  @action
  void setSenha(String? value) {
    print(value);
    senha = value;
  }

  @computed
  bool get senhaValid => senha != null && senha!.length >= 4;

  String? get senhaError {
    if (senha == null || senhaValid) {
      return null;
    } else if (senha != null && senha!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Deve ter pelo menos 4 dígitos.';
    }
  }

  @observable
  String? error;

  @observable
  bool loading = false;

  @computed
  Function? get loginPressed {
    return (usuarioValid && senhaValid && !loading) ? _login : null;
  }

  @action
  Future<bool> _login() async {
    loading = true;

    try {
      Usuario? resultUser = await UsuarioRepositorio().Login(usuario, senha);

      GetIt.I<UserManagerStore>().setUser(resultUser);

      error = null;
      loading = false;
      senha = null;
      return true;
    } catch (e) {
      error = e.toString();
      loading = false;
      return false;
    }
  }
}
