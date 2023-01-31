import 'package:fairhouseexpositor/stores/user_manager_store.dart';
import 'package:get_it/get_it.dart';

final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

getUrlServer() {
  return "http://3.92.2.39/app-fairhouse/";
}

getUrlLogin(String? user, senha) {
  var url =
      getUrlServer() + "login.php" + "?usuario=" + user + "&senha=" + senha;
  return Uri.parse(url);
}

getUrlDadosVisitante(String id_visitante) {
  var url = getUrlServer() + "getdadosvisitante.php?id=${id_visitante}";
  return Uri.parse(url);
}

getUrlGravarVisitaStand(String id_visitante) {
  var url = getUrlServer() +
      "gravarvisita.php?id_visitante=${id_visitante}&id_expositor=${userManagerStore.user!.id}";
  return Uri.parse(url);
}

getUrlVisitantesStand(String filtro) {
  var url =
      getUrlServer() + "visitantesstand.php?id=${userManagerStore.user!.id}";

  if (filtro != null && filtro.trim().isNotEmpty) {
    url += "&filtro=" + filtro;
  } else {
    url += "&filtro=false";
  }
  print(url);
  return Uri.parse(url);
}

getUrlVisitantesFeira(String filtro) {
  var url = getUrlServer() + "visitantesfeira.php";
  if (filtro != null && filtro.trim().isNotEmpty) {
    url += "?filtro=" + filtro;
  } else {
    url += "?filtro=false";
  }
  print(url);
  return Uri.parse(url);
}

getUrlVisitantesHora() {
  var url = getUrlServer() + "visitanteshora.php";
  return Uri.parse(url);
}

getUrlResumo() {
  var url = getUrlServer() + "resumo.php/?id=${userManagerStore.user!.id}";
  return Uri.parse(url);
}

getUrlGravarSaida(int idVisitante) {
  var url = getUrlServer() + "gravarsaida.php?id_visitante=$idVisitante";
  return Uri.parse(url);
}

getUrlGravarEntrada(int idVisitante) {
  var url = getUrlServer() + "gravarentrada.php?id_visitante=$idVisitante";
  return Uri.parse(url);
}
