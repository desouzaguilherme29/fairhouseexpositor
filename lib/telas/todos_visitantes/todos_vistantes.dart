import 'dart:convert';
import 'dart:math';

import 'package:cool_alert/cool_alert.dart';
import 'package:fairhouseexpositor/componentes/components.dart';
import 'package:fairhouseexpositor/componentes/drawer/drawer.dart';
import 'package:fairhouseexpositor/stores/visitantes_feira.dart';
import 'package:fairhouseexpositor/telas/meus_visitantes/componentes/dialog_pesquisa.dart';
import 'package:fairhouseexpositor/telas/todos_visitantes/componentes/list_view_visitantes_feira.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import '../../models/url_service.dart';

class TodosVisitantes extends StatelessWidget {
  VisitantesFeira visitantes = GetIt.I<VisitantesFeira>();

  abrePesquisa(BuildContext context) async {
    final texto = await showDialog(
        context: context, builder: (_) => DialogPesquisa(visitantes.pesquisa));

    if (texto != null) {
      visitantes.setPesquisa(texto);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Observer(builder: (_) {
            if (visitantes.pesquisa == null) {
              return Container();
            } else {
              return GestureDetector(
                onTap: () => abrePesquisa(context),
                child: LayoutBuilder(builder: (_, constraits) {
                  return Container(
                    width: constraits.biggest.width,
                    child: Text(
                      visitantes.pesquisa == ""
                          ? "Visitando a feira"
                          : visitantes.pesquisa,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "WorkSansMedium",
                      ),
                    ),
                  );
                }),
              );
            }
          }),
          actions: [
            Observer(builder: (_) {
              if (visitantes.pesquisa.isEmpty) {
                return IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 35,
                    ),
                    onPressed: () {
                      abrePesquisa(context);
                    });
              } else {
                return IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => visitantes.setPesquisa(''),
                );
              }
            })
          ],
        ),
        body: RefreshIndicator(
          onRefresh: visitantes.loadVisitantes,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                ElevatedButton(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.envelope,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Receber lista no E-mail",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: "WorkSansMedium",
                        ),
                      )
                    ],
                  ),
                  onPressed: () => _solicitarRelatorio(context),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Observer(builder: (_) {
                    if (visitantes.error != null) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline_outlined,
                            color: Colors.white,
                            size: 80,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Ocorreu um erro! \n${visitantes.error}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: "WorkSansMedium",
                            ),
                          )
                        ],
                      );
                    } else if (visitantes.loading) {
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      );
                    } else if (visitantes.visitanteList.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.mood_bad_outlined,
                              color: Colors.white,
                              size: 80,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Não há resultados...",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontFamily: "WorkSansMedium",
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return ListViewVisitantesFeira();
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _solicitarRelatorio(BuildContext context) async {
    http.Response response;
    Uri url;
    url = getUrlEnvioRelatorio();
    response = await http.post(url);

    if (response.statusCode == 200) {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        text:
            "Todos os visitantes foram enviados, verifique o de e-mail informado no cadastro do expositor.",
        title: "Solicitação bem sucedida!",
      );
    } else if (response.statusCode == 500) {
      var value = json.decode(response.body);
      CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: "Ops, algo deu errado!",
          text: value["message"]);
    } else {
      CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: "Servidor inacessível",
          text: "Tente novamente");
    }
  }
}
