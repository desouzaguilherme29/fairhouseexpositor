import 'package:fairhouseexpositor/models/VisitantesHora.dart';
import 'package:fairhouseexpositor/repositorios/visitantes_repositorio.dart';
import 'package:mobx/mobx.dart';

part 'visitantes_hora_evento.g.dart';

class VisitantesHoraEvento = _VisitantesHoraEvento with _$VisitantesHoraEvento;

abstract class _VisitantesHoraEvento with Store {
  _VisitantesHoraEvento() {
    loadVisitantes();
  }

  ObservableList<VisitantesHora> visitanteListHora =
      ObservableList<VisitantesHora>();

  @action
  void setVisitantes(List<VisitantesHora> visitante) {
    visitanteListHora.clear();
    visitanteListHora.addAll(visitante);
  }

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  String? error;

  @action
  void setError(value) => error = value;

  Future<void> loadVisitantes() async {
    loading = true;
    try {
      final visitantes = await VisitanteRepositorio().getListaVisitantesHora();
      setVisitantes(visitantes);

      loading = false;
      error = null;
      //return true;
    } catch (e) {
      error = e.toString();
      loading = false;
      //return false;
    }
  }
}
