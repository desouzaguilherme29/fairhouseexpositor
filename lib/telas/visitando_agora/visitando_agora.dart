import 'package:fairhouseexpositor/componentes/components.dart';
import 'package:fairhouseexpositor/componentes/drawer/drawer.dart';
import 'package:fairhouseexpositor/stores/visitantes_feira.dart';
import 'package:fairhouseexpositor/telas/meus_visitantes/componentes/dialog_pesquisa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'componentes/list_view_visitando_agora.dart';

class VisitandoAgora extends StatelessWidget {
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
                          ? "Visitando agora"
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
                Expanded(
                  child: Observer(builder: (_) {
                    if (visitantes.error != null) {
                      return compErrorList(visitantes.error);
                    } else if (visitantes.showProgress) {
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Color.fromRGBO(63, 81, 181, 1.0)),
                        ),
                      );
                    } else if (visitantes.visitanteList.isEmpty) {
                      return compEmptyList();
                    } else {
                      return ListViewVisitandoAgoraFeira();
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
}
