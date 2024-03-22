import 'package:fairhouseexpositor/models/VisitanteStand.dart';
import 'package:fairhouseexpositor/stores/user_manager_store.dart';
import 'package:fairhouseexpositor/stores/visitante_stand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:fairhouseexpositor/extensions/extensions.dart';

import '../../../componentes/components.dart';
import '../../../globais/global_functions.dart';

VisitanteStandStore visitanteStore = GetIt.I<VisitanteStandStore>();
UserManagerStore _user = GetIt.I<UserManagerStore>();

class ListViewVisitantesStand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: visitanteStore.visitanteList.length,
      itemBuilder: (context, index) {
        VisitanteStand visitante = visitanteStore.visitanteList[index];
        return compItemList(visitante.nome, visitante.fantasia, visitante.cidade, visitante.email, visitante.celular, visitante.celularformatado, _user.user!.nome!, visitante.tipo, true, context);
      },
    );
  }
}
