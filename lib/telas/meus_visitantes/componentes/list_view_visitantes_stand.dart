import 'package:fairhouseexpositor/models/VisitanteStand.dart';
import 'package:fairhouseexpositor/stores/user_manager_store.dart';
import 'package:fairhouseexpositor/stores/visitante_stand.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fairhouseexpositor/extensions/extensions.dart';

VisitanteStandStore visitanteStore = GetIt.I<VisitanteStandStore>();
UserManagerStore _user = GetIt.I<UserManagerStore>();

class ListViewVisitantesStand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(15.0),
      itemCount: visitanteStore.visitanteList.length,
      itemBuilder: (context, index) {
        VisitanteStand visitante = visitanteStore.visitanteList[index];
        return _singleItemWidget(visitante, context);
      },
    );
  }
}

Widget _singleItemWidget(VisitanteStand visitante, BuildContext context) {
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
                      var url = "whatsapp://send?phone=+55${visitante.celular}&text=Muito Obrigado por Visitar nosso Stand, Nós da ${_user.user.nome.toLowerCase().capitalizeFirstofEach} ficamos honrados com sua presença!";

                      if (await canLaunch(url)) {
                      await launch(url);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
