import 'package:fairhouseexpositor/models/VisitanteFeira.dart';
import 'package:fairhouseexpositor/stores/user_manager_store.dart';
import 'package:fairhouseexpositor/stores/visitantes_feira.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:fairhouseexpositor/extensions/extensions.dart';

import '../../../globais/global_functions.dart';

VisitantesFeira visitanteStore = GetIt.I<VisitantesFeira>();
UserManagerStore _user = GetIt.I<UserManagerStore>();

class ListViewVisitantesFeira extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(15.0),
      itemCount: visitanteStore.visitanteList.length,
      itemBuilder: (context, index) {
        VisitanteFeira visitante = visitanteStore.visitanteList[index];
        return _singleItemWidget(visitante, context);
      },
    );
  }
}

Widget _singleItemWidget(VisitanteFeira visitante, BuildContext context) {
  return Card(
    color: Colors.white,
    child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        visitante.nome.toString(),
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          fontFamily: "WorkSansMedium",
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        visitante.cidade.toString(),
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: "WorkSansMedium",
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      visitante.fantasia.toString(),
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: "WorkSansMedium",
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      visitante.celular.toString(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: "WorkSansMedium",
                        color: Colors.black,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      chamarWhats(
                        number: visitante.celular!,
                        text:
                            "Olá, Notei que Você esta visitando a FairHouse, Venha nos visitar no nosso stand! Att. ${_user.user!.nome!.toLowerCase().capitalizeFirstofEach}.",
                      );
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Icon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.green,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        )
      ],
    ),
  );
}
