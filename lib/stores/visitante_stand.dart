import 'package:fairhouseexpositor/models/VisitanteStand.dart';
import 'package:fairhouseexpositor/repositorios/visitantes_repositorio.dart';
import 'package:mobx/mobx.dart';

part 'visitante_stand.g.dart';

class VisitanteStandStore = _VisitanteStandStore with _$VisitanteStandStore;

abstract class _VisitanteStandStore with Store {
  _VisitanteStandStore() {
    autorun((_) async {
      setLoading(true);
      try {
        visitanteList.clear();
        final visitantes = await VisitanteRepositorio()
            .getListaVisitantesStand(filtro: pesquisa);

        visitanteList.clear();
        if (visitantes.isNotEmpty) {
          visitanteList.addAll(visitantes);
        }
        setError(null);
        setLoading(false);
      } catch (e) {
        error = e.toString();
      }
    });
  }

  ObservableList<VisitanteStand> visitanteList =
      ObservableList<VisitanteStand>();

  @action
  void setVisitantes(List<VisitanteStand> visitante) {
    visitanteList.clear();
    visitanteList.addAll(visitante);
  }

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  String? error;

  @action
  void setError(value) => error = value;

  @observable
  String pesquisa = '';

  @action
  void setPesquisa(String value) => pesquisa = value;

  Future<void> loadVisitantes() async {
    loading = true;
    try {
      final visitantes = await VisitanteRepositorio().getListaVisitantesStand(
        filtro: pesquisa,
      );
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
