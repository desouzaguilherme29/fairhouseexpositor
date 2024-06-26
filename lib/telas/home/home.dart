import 'dart:convert';
import 'dart:io';
import 'package:cool_alert/cool_alert.dart';
import 'package:fairhouseexpositor/componentes/components.dart';
import 'package:fairhouseexpositor/componentes/drawer/drawer.dart';
import 'package:fairhouseexpositor/models/Visitante.dart';
import 'package:fairhouseexpositor/models/url_service.dart';
import 'package:fairhouseexpositor/telas/qr_reader/qr_reader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:fairhouseexpositor/globais/global_statics.dart';

import '../portaria/ambiente.dart';
import '../portaria/portaria.dart';

Visitante? visitante = Visitante();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerFantasia = TextEditingController();
  TextEditingController _controllerRazaoSocial = TextEditingController();
  TextEditingController _controllerCidade = TextEditingController();
  TextEditingController _controllerTipo = TextEditingController();
  SingingCharacter _character = SingingCharacter.Entrada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text("Bem Vindo"),
        ),
        body: userManagerStore.user!.id == 1
            ? Center(
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 8,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.all(25),
                          height: 170,
                          color: Colors.white10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RadioListTile<SingingCharacter>(
                                title: const Text('Entrada',
                                    style: TextStyle(
                                      fontFamily: "WorkSansMedium",
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800,
                                    )),
                                value: SingingCharacter.Entrada,
                                groupValue: _character,
                                onChanged: (SingingCharacter? value) {
                                  setState(() {
                                    _character = value!;
                                    GlobalStatics.entrada = true;
                                  });
                                },
                              ),
                              RadioListTile<SingingCharacter>(
                                title: const Text(
                                  'Saída',
                                  style: TextStyle(
                                    fontFamily: "WorkSansMedium",
                                    fontSize: 25,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                value: SingingCharacter.Saida,
                                groupValue: _character,
                                onChanged: (SingingCharacter? value) {
                                  setState(() {
                                    _character = value!;
                                    GlobalStatics.entrada = false;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 16),
                          height: 50,
                          child: customElevatedButton(
                            context,
                            "Entrar",
                            Colors.orange,
                            Colors.orange.withAlpha(120),
                            _entrar,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : Center(
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 8,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 455,
                          child: Column(
                            children: [
                              _textField(_controllerNome, "Nome",
                                  FontAwesomeIcons.user),
                              Container(
                                width: 250.0,
                                height: 1.0,
                                color: Colors.grey[400],
                              ),
                              _textField(_controllerFantasia, "Fantasia",
                                  FontAwesomeIcons.building),
                              Container(
                                width: 250.0,
                                height: 1.0,
                                color: Colors.grey[400],
                              ),
                              _textField(_controllerRazaoSocial, "Razão Social",
                                  FontAwesomeIcons.briefcase),
                              Container(
                                width: 250.0,
                                height: 1.0,
                                color: Colors.grey[400],
                              ),
                              _textField(_controllerCidade, "Cidade",
                                  FontAwesomeIcons.city),
                              Container(
                                width: 250.0,
                                height: 1.0,
                                color: Colors.grey[400],
                              ),
                              _textField(_controllerTipo, "Tipo",
                                  FontAwesomeIcons.idBadge),
                              Container(
                                width: 250.0,
                                height: 1.0,
                                color: Colors.grey[400],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: 50,
                          child: customElevatedButton(
                            context,
                            "Ler",
                            Colors.orange,
                            Colors.orange.withAlpha(120),
                            _leVisitante,
                          ),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: 50,
                          child: customElevatedButton(
                            context,
                            "Gravar",
                            Colors.orange,
                            Colors.orange.withAlpha(120),
                            visitante != null ? _gravaVisita : null,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
  }

  _textField(TextEditingController _controller, String _text, IconData _icon) {
    return Padding(
      padding: EdgeInsets.only(top: 0.0, bottom: 0.0, left: 0.0, right: 0.0),
      child: TextFormField(
        controller: _controller,
        readOnly: true,
        minLines: 2,
        maxLines: 2,
        style: TextStyle(
          fontFamily: "WorkSansSemiBold",
          fontSize: 17.0,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            _icon,
            color: Colors.orange.withOpacity(0.8),
            size: 20.0,
          ),
          labelText: _text,
          hintText: _text,
          hintStyle: TextStyle(
            fontFamily: "WorkSansSemiBold",
            fontSize: 17.0,
            color: Colors.orange.withOpacity(0.8),
          ),
        ),
      ),
    );
  }

  Future _getVisitante(String id_visitante) async {
    http.Response response;
    var url = getUrlDadosVisitante(id_visitante);
    response = await http.get(url);

    if (response.statusCode == 200) {
      var values = json.decode(response.body);
      if (values.toString().length > 0) {
        values.forEach((element) {
          print(element.toString());
          setState(() {
            var x = Visitante.fromJson(element);
            visitante = x;
          });
        });

        _atualizaTela();
      }
    }
  }

  _atualizaTela() {
    _controllerNome.text = visitante!.nome!;
    _controllerFantasia.text = visitante!.fantasia!;
    _controllerRazaoSocial.text = visitante!.razaosocial!;
    _controllerCidade.text = visitante!.cidade!;
    _controllerTipo.text = visitante!.tipo!;
  }

  Future _gravaVisita() async {
    http.Response response;
    var url = getUrlGravarVisitaStand(visitante!.id.toString());

    response = await http.post(url);

    if (response.statusCode == 200) {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        text: "Visita registrada com sucesso",
        title: "Visita gravada!",
      );

      setState(() {
        visitante = null;
      });
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
        text: "Servidor inacessível",
        title: "Tente novamente!",
      );
    }
  }

  _leVisitante() async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const QRViewExample(),
      ),
    );

    if (result.isNotEmpty) {
      await _getVisitante(result);
    }
  }

  _entrar() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Portaria(),
      ),
    );
  }
}
