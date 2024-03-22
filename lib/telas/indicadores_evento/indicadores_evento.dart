import 'package:fairhouseexpositor/componentes/drawer/drawer.dart';
import 'package:fairhouseexpositor/stores/resumo_stand.dart';
import 'package:fairhouseexpositor/stores/visitantes_hora_evento.dart';
import 'package:fairhouseexpositor/telas/indicadores_evento/componentes/grafico_horas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../componentes/components.dart';
import '../../stores/page_store.dart';

class IndicadoresEvento extends StatelessWidget {
  VisitantesHoraEvento _visitantesHoraEvento = GetIt.I<VisitantesHoraEvento>();
  ResumoStand _resumoStand = GetIt.I<ResumoStand>();
  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          "Indicadores Evento",
          style: TextStyle(
            fontFamily: "WorkSansMedium",
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              _visitantesHoraEvento.loadVisitantes();
              _resumoStand.loadResumo();
            },
            child: Icon(
              Icons.refresh,
              size: 30,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Observer(builder: (_) {
            if (_resumoStand.error != null) {
              return compErrorList(_resumoStand.error);
            } else if (_resumoStand.loading) {
              return compLoadingList();
            } else if (_resumoStand.resumoList.isEmpty) {
              return compEmptyList();
            } else {
              return Container(
                height: MediaQuery.of(context).size.height * 0.48,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            pageStore.setPage(3);
                          },
                          child: _containerInfo(
                            context,
                            "Cadastros",
                            _resumoStand.resumoList[0].cadastrados.toString(),
                            Colors.blue,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            pageStore.setPage(3);
                          },
                          child: _containerInfo(
                              context,
                              "Ja Visitaram",
                              _resumoStand.resumoList[0].jaPassaramPeloEvento
                                  .toString(),
                              Colors.purple),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            pageStore.setPage(5);
                          },
                          child: _containerInfo(
                            context,
                            "Visitando agora",
                            _resumoStand.resumoList[0].visitandoAgora
                                .toString(),
                            Color.fromRGBO(19, 49, 13, 1.0),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            pageStore.setPage(1);
                          },
                          child: _containerInfo(
                            context,
                            "Visitaram o Stand",
                            _resumoStand.resumoList[0].pessoasVisitaramSeuStand
                                .toString(),
                            Colors.blueAccent,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
          }),
          SizedBox(
            height: 35,
          ),
          Observer(builder: (_) {
            if (_visitantesHoraEvento.error != null) {
              return compErrorList(_visitantesHoraEvento.error);
            } else if (_visitantesHoraEvento.loading) {
              return compLoadingList();
            } else if (_visitantesHoraEvento.visitanteListHora.isEmpty) {
              return compEmptyList();
            } else {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GraficoHora(),
              );
            }
          }),
        ],
      ),
    );
  }
}

Widget _containerInfo(
    BuildContext context, String descricao, String dado, Color cor) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: cor,
    ),
    margin: EdgeInsets.all(5),
    height: MediaQuery.of(context).size.height * 0.225,
    width: MediaQuery.of(context).size.width * 0.45,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Text(
              descricao,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "WorkSansMedium",
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 85,
            child: Text(
              dado,
              style: TextStyle(
                fontFamily: "WorkSansMedium",
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
