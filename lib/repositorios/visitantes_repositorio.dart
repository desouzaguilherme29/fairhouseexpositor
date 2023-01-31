import 'dart:convert';

import 'package:fairhouseexpositor/models/Resumo.dart';
import 'package:fairhouseexpositor/models/VisitanteFeira.dart';
import 'package:fairhouseexpositor/models/VisitanteStand.dart';
import 'package:fairhouseexpositor/models/VisitantesHora.dart';
import 'package:fairhouseexpositor/models/url_service.dart';
import 'package:fairhouseexpositor/stores/resumo_stand.dart';
import 'package:http/http.dart' as http;

class VisitanteRepositorio {
  Future<List<VisitanteStand>> getListaVisitantesStand({String? filtro}) async {
    http.Response response;
    List<VisitanteStand> visitantes = [];
    var url = getUrlVisitantesStand(filtro!);
    response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.body.isEmpty) {
        return [];
      }
      var values = json.decode(utf8.decode(response.bodyBytes));
      if (values.toString().length > 0) {
        values.forEach((element) {
          visitantes.add(VisitanteStand.fromJson(element));
        });
        return visitantes;
      }
    }

    return [];
  }

  Future<List<VisitantesHora>> getListaVisitantesHora() async {
    http.Response response;
    List<VisitantesHora> visitantes = [];
    var url = getUrlVisitantesHora();
    response = await http.get(url);

    if (response.statusCode == 200) {
      if (response.body.isEmpty) {
        return [];
      }
      var values = json.decode(utf8.decode(response.bodyBytes));

      if (values.toString().length > 0) {
        values.forEach((element) {
          visitantes.add(VisitantesHora.fromJson(element));
        });
        return visitantes;
      }
    }
    print(visitantes);
    return [];
  }

  Future<List<VisitanteFeira>> getListaVisitantesFeira({String? filtro}) async {
    http.Response response;
    List<VisitanteFeira> visitantes = [];

    response = await http.get(getUrlVisitantesFeira(filtro!));
    if (response.statusCode == 200) {
      if (response.body.isEmpty) {
        return [];
      }
      var values = json.decode(utf8.decode(response.bodyBytes));
      if (values.toString().length > 0) {
        values.forEach((element) {
          visitantes.add(VisitanteFeira.fromJson(element));
        });
        return visitantes;
      }
    }

    return visitantes;
  }

  Future<List<Resumo>> getResumo() async {
    http.Response response;
    List<Resumo> visitantes = [];
    response = await http.get(getUrlResumo());
    if (response.statusCode == 200) {
      if (response.body.isEmpty) {
        return [];
      }
      var values = json.decode(utf8.decode(response.bodyBytes));
      if (values.toString().length > 0) {
        values.forEach((element) {
          visitantes.add(Resumo.fromJson(element));
        });
        return visitantes;
      }
    }

    return [];
  }
}
