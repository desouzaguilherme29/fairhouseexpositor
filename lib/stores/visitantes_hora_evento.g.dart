// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitantes_hora_evento.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VisitantesHoraEvento on _VisitantesHoraEvento, Store {
  late final _$loadingAtom =
      Atom(name: '_VisitantesHoraEvento.loading', context: context);

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
      Atom(name: '_VisitantesHoraEvento.error', context: context);

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

  late final _$_VisitantesHoraEventoActionController =
      ActionController(name: '_VisitantesHoraEvento', context: context);

  @override
  void setVisitantes(List<VisitantesHora> visitante) {
    final _$actionInfo = _$_VisitantesHoraEventoActionController.startAction(
        name: '_VisitantesHoraEvento.setVisitantes');
    try {
      return super.setVisitantes(visitante);
    } finally {
      _$_VisitantesHoraEventoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_VisitantesHoraEventoActionController.startAction(
        name: '_VisitantesHoraEvento.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_VisitantesHoraEventoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(dynamic value) {
    final _$actionInfo = _$_VisitantesHoraEventoActionController.startAction(
        name: '_VisitantesHoraEvento.setError');
    try {
      return super.setError(value);
    } finally {
      _$_VisitantesHoraEventoActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
error: ${error}
    ''';
  }
}
