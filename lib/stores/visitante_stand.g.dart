// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitante_stand.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VisitanteStandStore on _VisitanteStandStore, Store {
  late final _$loadingAtom =
      Atom(name: '_VisitanteStandStore.loading', context: context);

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

  late final _$errorAtom =
      Atom(name: '_VisitanteStandStore.error', context: context);

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

  late final _$pesquisaAtom =
      Atom(name: '_VisitanteStandStore.pesquisa', context: context);

  @override
  String get pesquisa {
    _$pesquisaAtom.reportRead();
    return super.pesquisa;
  }

  @override
  set pesquisa(String value) {
    _$pesquisaAtom.reportWrite(value, super.pesquisa, () {
      super.pesquisa = value;
    });
  }

  late final _$_VisitanteStandStoreActionController =
      ActionController(name: '_VisitanteStandStore', context: context);

  @override
  void setVisitantes(List<VisitanteStand> visitante) {
    final _$actionInfo = _$_VisitanteStandStoreActionController.startAction(
        name: '_VisitanteStandStore.setVisitantes');
    try {
      return super.setVisitantes(visitante);
    } finally {
      _$_VisitanteStandStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_VisitanteStandStoreActionController.startAction(
        name: '_VisitanteStandStore.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_VisitanteStandStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(dynamic value) {
    final _$actionInfo = _$_VisitanteStandStoreActionController.startAction(
        name: '_VisitanteStandStore.setError');
    try {
      return super.setError(value);
    } finally {
      _$_VisitanteStandStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPesquisa(String value) {
    final _$actionInfo = _$_VisitanteStandStoreActionController.startAction(
        name: '_VisitanteStandStore.setPesquisa');
    try {
      return super.setPesquisa(value);
    } finally {
      _$_VisitanteStandStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
error: ${error},
pesquisa: ${pesquisa}
    ''';
  }
}
