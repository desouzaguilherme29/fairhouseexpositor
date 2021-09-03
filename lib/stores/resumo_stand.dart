import 'package:fairhouseexpositor/models/Resumo.dart';
import 'package:fairhouseexpositor/repositorios/visitantes_repositorio.dart';
import 'package:mobx/mobx.dart';

part 'resumo_stand.g.dart';

class ResumoStand = _ResumoStand with _$ResumoStand;

abstract class _ResumoStand with Store{
  _ResumoStand(){
    loadResumo();
  }

  ObservableList<Resumo> resumoList = ObservableList<Resumo>();

  @action
  void setVisitantes(List<Resumo> resumo) {
    resumoList.clear();
    resumoList.addAll(resumo);
  }

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  String error;

  @action
  void setError(value) => error = value;

  @observable
  String pesquisa = '';

  @action
  void setPesquisa(String value) => pesquisa = value;

  Future<void> loadResumo() async {
    loading = true;
    try {
      final visitantes = await VisitanteRepositorio().getResumo();
      setVisitantes(visitantes);

      loading = false;
      error = null;
      return true;
    } catch (e) {
      error = e.toString();
      loading = false;
      return false;
    }
  }
}
