// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStore, Store {
  Computed<bool>? _$usuarioValidComputed;

  @override
  bool get usuarioValid =>
      (_$usuarioValidComputed ??= Computed<bool>(() => super.usuarioValid,
              name: '_LoginStore.usuarioValid'))
          .value;
  Computed<bool>? _$senhaValidComputed;

  @override
  bool get senhaValid =>
      (_$senhaValidComputed ??= Computed<bool>(() => super.senhaValid,
              name: '_LoginStore.senhaValid'))
          .value;
  Computed<Function?>? _$loginPressedComputed;

  @override
  Function? get loginPressed =>
      (_$loginPressedComputed ??= Computed<Function?>(() => super.loginPressed,
              name: '_LoginStore.loginPressed'))
          .value;

  late final _$usuarioAtom =
      Atom(name: '_LoginStore.usuario', context: context);

  @override
  String? get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(String? value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  late final _$senhaAtom = Atom(name: '_LoginStore.senha', context: context);

  @override
  String? get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String? value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  late final _$errorAtom = Atom(name: '_LoginStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_LoginStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$_loginAsyncAction =
      AsyncAction('_LoginStore._login', context: context);

  @override
  Future<bool> _login() {
    return _$_loginAsyncAction.run(() => super._login());
  }

  late final _$_LoginStoreActionController =
      ActionController(name: '_LoginStore', context: context);

  @override
  void setUsuario(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setUsuario');
    try {
      return super.setUsuario(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String? value) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
senha: ${senha},
error: ${error},
loading: ${loading},
usuarioValid: ${usuarioValid},
senhaValid: ${senhaValid},
loginPressed: ${loginPressed}
    ''';
  }
}
