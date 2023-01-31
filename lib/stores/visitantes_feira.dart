import 'package:fairhouseexpositor/models/VisitanteFeira.dart';
import 'package:fairhouseexpositor/repositorios/visitantes_repositorio.dart';
import 'package:mobx/mobx.dart';

part 'visitantes_feira.g.dart';

class VisitantesFeira = _VisitantesFeira with _$VisitantesFeira;

abstract class _VisitantesFeira with Store {
  _VisitantesFeira() {
    autorun((_) async {
      setLoading(true);
      try {
        visitanteList.clear();
        final visitantes = await VisitanteRepositorio()
            .getListaVisitantesFeira(filtro: pesquisa);

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

  ObservableList<VisitanteFeira> visitanteList =
      ObservableList<VisitanteFeira>();

  @observable
  String pesquisa = '';

  @action
  void setPesquisa(String value) => pesquisa = value;

  @action
  void setVisitantes(List<VisitanteFeira> visitante) {
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

  Future<void> loadVisitantes() async {
    loading = true;
    try {
      final visitantes = await VisitanteRepositorio().getListaVisitantesFeira(
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
