import 'dart:ffi';

import 'package:fairhouseexpositor/stores/user_manager_store.dart';
import 'package:get_it/get_it.dart';

final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

getUrlServer() {
  return "https://api.solucoesgenius.com.br:8830/";
}

getUrlLogin(String? user, senha) {
  var url = getUrlServer() + "autenticacao/mobile/login";
  return Uri.parse(url);
}

getUrlDadosVisitante(String id_visitante) {
  var url = getUrlServer() +
      "mobile/portaria/gravarvisita?id_visitante=${id_visitante}";
  return Uri.parse(url);
}

getUrlGravarVisitaStand(String id_visitante) {
  var url = getUrlServer() +
      "mobile/portaria/gravarvisita?id_visitante=${id_visitante}&id_expositor=${userManagerStore.user!.id}";
  return Uri.parse(url);
}

getUrlVisitantesStand(String filtro) {
  var url = getUrlServer() +
      "mobile/indicadores/visitantes-stand?id_expositor=${userManagerStore.user!.id}&pesquisa=${filtro}";

  return Uri.parse(url);
}

getUrlVisitantesFeira(String filtro, int pagina) {
  var url = getUrlServer() +
      "mobile/indicadores/visitantes-evento?pesquisa=$filtro&pagina=$pagina";

  return Uri.parse(url);
}

getUrlTodosVisitantesFeira(String filtro, int pagina) {
  var url = getUrlServer() +
      "mobile/indicadores/todos-visitantes-evento?pesquisa=$filtro&pagina=$pagina";

  return Uri.parse(url);
}

getUrlVisitantesHora() {
  var url = getUrlServer() + "mobile/indicadores/visitantes-hora";
  return Uri.parse(url);
}

getUrlResumo() {
  var url = getUrlServer() +
      "mobile/indicadores/resumo?id_expositor=${userManagerStore.user!.id}";
  return Uri.parse(url);
}

getUrlGravarSaida(int idVisitante) {
  var url =
      getUrlServer() + "mobile/portaria/gravarvisita?id_visitante=$idVisitante";
  return Uri.parse(url);
}

getUrlGravarEntrada(int idVisitante) {
  var url =
      getUrlServer() + "mobile/portaria/gravarvisita?id_visitante=$idVisitante";
  return Uri.parse(url);
}

getUrlEnvioRelatorio() {
  var url = getUrlServer() +
      "relatorios/visitantes/enviar-relatorio-visitantes?id=${userManagerStore.user!.id}";
  return Uri.parse(url);
}
