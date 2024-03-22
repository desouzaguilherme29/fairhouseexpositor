import 'package:fairhouseexpositor/models/VisitanteFeira.dart';
import 'package:fairhouseexpositor/stores/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../../componentes/components.dart';
import '../../../stores/visitantes_feira.dart';

VisitantesFeira visitanteStore = GetIt.I<VisitantesFeira>();
UserManagerStore _user = GetIt.I<UserManagerStore>();

class ListViewVisitandoAgoraFeira extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListView.builder(
        itemCount: visitanteStore.itemCount,
        itemBuilder: (_, index) {
          if (index < visitanteStore.visitanteList.length) {
            VisitanteFeira visitante = visitanteStore.visitanteList[index];
            return compItemList(
                visitante.nome,
                visitante.fantasia,
                visitante.cidade,
                visitante.email,
                visitante.celular,
                visitante.celularformatado,
                _user.user!.nome!,
                visitante.tipo,
                false,
                context);
          }

          visitanteStore.carregaProximaPagina();
          return Container(
            height: 10,
            child: LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.orange),
              backgroundColor: Colors.black,
            ),
          );
        },
      );
    });
  }
}
