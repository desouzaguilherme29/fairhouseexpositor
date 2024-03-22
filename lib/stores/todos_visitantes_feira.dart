import 'package:fairhouseexpositor/models/VisitanteFeira.dart';
import 'package:fairhouseexpositor/repositorios/visitantes_repositorio.dart';
import 'package:mobx/mobx.dart';

part 'todos_visitantes_feira.g.dart';

class TodosVisitantesFeira = _TodosVisitantesFeira with _$TodosVisitantesFeira;

abstract class _TodosVisitantesFeira with Store {
  _TodosVisitantesFeira() {
    autorun((_) async {
      setLoading(true);
      try {
        List<VisitanteFeira> visitantes = [];
        visitantes = await VisitanteRepositorio()
            .getListaTodosVisitantesFeira(filtro: pesquisa, pagina: pagina);

        novosVisitantes(visitantes);
        setError(null);
        setLoading(false);
      } catch (e) {
        setError(e.toString());
      }
    });
  }

  @observable
  bool loading = false;

  @observable
  String? error;

  @observable
  int pagina = 1;

  @observable
  bool lastpage = false;

  @observable
  String pesquisa = '';

  @action
  void setLoading(bool value) => loading = value;

  @action
  void setError(String? value) => error = value;

  ObservableList<VisitanteFeira> visitanteList =
      ObservableList<VisitanteFeira>();

  @action
  void setPesquisa(String value) {
    pesquisa = value.trimLeft().trimRight();
    resetPage();
  }

  @action
  void setVisitantes(List<VisitanteFeira> visitante) {
    visitanteList.clear();
    visitanteList.addAll(visitante);
  }

  @action
  void carregaProximaPagina() {
    pagina++;
  }

  @computed
  int get itemCount =>
      lastpage ? visitanteList.length : visitanteList.length + 1;

  @computed
  bool get showProgress => loading && visitanteList.isEmpty;

  void novosVisitantes(List<VisitanteFeira> visitantes) {
    if (visitantes.length < 15) lastpage = true;

    visitanteList.addAll(visitantes);
  }

  void resetPage() {
    pagina = 1;
    visitanteList.clear();
    lastpage = false;
  }

  Future<void> loadVisitantes() async {
      resetPage();
  }
}
