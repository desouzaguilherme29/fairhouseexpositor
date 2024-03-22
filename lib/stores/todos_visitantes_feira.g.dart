// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_visitantes_feira.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodosVisitantesFeira on _TodosVisitantesFeira, Store {
  Computed<int>? _$itemCountComputed;

  @override
  int get itemCount =>
      (_$itemCountComputed ??= Computed<int>(() => super.itemCount,
              name: '_TodosVisitantesFeira.itemCount'))
          .value;
  Computed<bool>? _$showProgressComputed;

  @override
  bool get showProgress =>
      (_$showProgressComputed ??= Computed<bool>(() => super.showProgress,
              name: '_TodosVisitantesFeira.showProgress'))
          .value;

  late final _$loadingAtom =
      Atom(name: '_TodosVisitantesFeira.loading', context: context);

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
      Atom(name: '_TodosVisitantesFeira.error', context: context);

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

  late final _$paginaAtom =
      Atom(name: '_TodosVisitantesFeira.pagina', context: context);

  @override
  int get pagina {
    _$paginaAtom.reportRead();
    return super.pagina;
  }

  @override
  set pagina(int value) {
    _$paginaAtom.reportWrite(value, super.pagina, () {
      super.pagina = value;
    });
  }

  late final _$lastpageAtom =
      Atom(name: '_TodosVisitantesFeira.lastpage', context: context);

  @override
  bool get lastpage {
    _$lastpageAtom.reportRead();
    return super.lastpage;
  }

  @override
  set lastpage(bool value) {
    _$lastpageAtom.reportWrite(value, super.lastpage, () {
      super.lastpage = value;
    });
  }

  late final _$pesquisaAtom =
      Atom(name: '_TodosVisitantesFeira.pesquisa', context: context);

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

  late final _$_TodosVisitantesFeiraActionController =
      ActionController(name: '_TodosVisitantesFeira', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_TodosVisitantesFeiraActionController.startAction(
        name: '_TodosVisitantesFeira.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_TodosVisitantesFeiraActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String? value) {
    final _$actionInfo = _$_TodosVisitantesFeiraActionController.startAction(
        name: '_TodosVisitantesFeira.setError');
    try {
      return super.setError(value);
    } finally {
      _$_TodosVisitantesFeiraActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPesquisa(String value) {
    final _$actionInfo = _$_TodosVisitantesFeiraActionController.startAction(
        name: '_TodosVisitantesFeira.setPesquisa');
    try {
      return super.setPesquisa(value);
    } finally {
      _$_TodosVisitantesFeiraActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVisitantes(List<VisitanteFeira> visitante) {
    final _$actionInfo = _$_TodosVisitantesFeiraActionController.startAction(
        name: '_TodosVisitantesFeira.setVisitantes');
    try {
      return super.setVisitantes(visitante);
    } finally {
      _$_TodosVisitantesFeiraActionController.endAction(_$actionInfo);
    }
  }

  @override
  void carregaProximaPagina() {
    final _$actionInfo = _$_TodosVisitantesFeiraActionController.startAction(
        name: '_TodosVisitantesFeira.carregaProximaPagina');
    try {
      return super.carregaProximaPagina();
    } finally {
      _$_TodosVisitantesFeiraActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
error: ${error},
pagina: ${pagina},
lastpage: ${lastpage},
pesquisa: ${pesquisa},
itemCount: ${itemCount},
showProgress: ${showProgress}
    ''';
  }
}
