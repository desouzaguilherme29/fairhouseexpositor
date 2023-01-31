// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resumo_stand.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResumoStand on _ResumoStand, Store {
  late final _$loadingAtom =
      Atom(name: '_ResumoStand.loading', context: context);

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

  late final _$errorAtom = Atom(name: '_ResumoStand.error', context: context);

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
      Atom(name: '_ResumoStand.pesquisa', context: context);

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

  late final _$_ResumoStandActionController =
      ActionController(name: '_ResumoStand', context: context);

  @override
  void setVisitantes(List<Resumo> resumo) {
    final _$actionInfo = _$_ResumoStandActionController.startAction(
        name: '_ResumoStand.setVisitantes');
    try {
      return super.setVisitantes(resumo);
    } finally {
      _$_ResumoStandActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_ResumoStandActionController.startAction(
        name: '_ResumoStand.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_ResumoStandActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(dynamic value) {
    final _$actionInfo = _$_ResumoStandActionController.startAction(
        name: '_ResumoStand.setError');
    try {
      return super.setError(value);
    } finally {
      _$_ResumoStandActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPesquisa(String value) {
    final _$actionInfo = _$_ResumoStandActionController.startAction(
        name: '_ResumoStand.setPesquisa');
    try {
      return super.setPesquisa(value);
    } finally {
      _$_ResumoStandActionController.endAction(_$actionInfo);
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
