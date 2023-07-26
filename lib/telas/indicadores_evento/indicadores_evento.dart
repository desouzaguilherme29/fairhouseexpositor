import 'package:fairhouseexpositor/componentes/drawer/drawer.dart';
import 'package:fairhouseexpositor/stores/resumo_stand.dart';
import 'package:fairhouseexpositor/stores/visitantes_hora_evento.dart';
import 'package:fairhouseexpositor/telas/indicadores_evento/componentes/grafico_horas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class IndicadoresEvento extends StatelessWidget {
  VisitantesHoraEvento _visitantesHoraEvento = GetIt.I<VisitantesHoraEvento>();
  ResumoStand _resumoStand = GetIt.I<ResumoStand>();

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
                    "Ocorreu um erro! \n${_resumoStand.error}",
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
            } else if (_resumoStand.loading) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              );
            } else if (_resumoStand.resumoList.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Ainda não há dados para serem processados.\n\nAguarde...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "WorkSansMedium",
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                height: MediaQuery.of(context).size.height * 0.48,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _containerInfo(
                            context,
                            "Cadastros",
                            _resumoStand.resumoList[0].cadastrados.toString(),
                            Colors.blue),
                        _containerInfo(
                            context,
                            "Ja Visitaram",
                            _resumoStand.resumoList[0].jaPassaramPeloEvento
                                .toString(),
                            Colors.purple),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _containerInfo(
                            context,
                            "Visitando agora",
                            _resumoStand.resumoList[0].visitandoAgora
                                .toString(),
                            Color.fromRGBO(19, 49, 13, 1.0)),
                        _containerInfo(
                            context,
                            "Visitaram o Stand",
                            _resumoStand.resumoList[0].pessoasVisitaramSeuStand
                                .toString(),
                            Colors.blueAccent),
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
                    "Ocorreu um erro! \n${_visitantesHoraEvento.error}",
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
            } else if (_visitantesHoraEvento.loading) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              );
            } else if (_visitantesHoraEvento.visitanteListHora.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 50),
                      child: Text(
                        "Ainda não há dados para análise gráfica.\n\nAguarde visitantes fazerem check-in...",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "WorkSansMedium",
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  color: Colors.white,
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
    margin: EdgeInsets.all(5),
    height: MediaQuery.of(context).size.height * 0.225,
    width: MediaQuery.of(context).size.width * 0.45,
    color: cor,
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
