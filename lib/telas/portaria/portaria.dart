import 'dart:convert';
import 'package:cool_alert/cool_alert.dart';
import 'package:fairhouseexpositor/globais/global_statics.dart';
import 'package:fairhouseexpositor/models/Visitante.dart';
import 'package:fairhouseexpositor/models/url_service.dart';
import 'package:fairhouseexpositor/telas/qr_reader/qr_reader.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

Visitante? visitante;

class Portaria extends StatefulWidget {
  @override
  _PortariaState createState() => _PortariaState();
}

class _PortariaState extends State<Portaria> {
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerFantasia = TextEditingController();
  TextEditingController _controllerRazaoSocial = TextEditingController();
  TextEditingController _controllerCidade = TextEditingController();
  TextEditingController _controllerTipo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalStatics.entrada
          ? Color.fromRGBO(2, 76, 42, 1.0)
          : Color.fromRGBO(106, 0, 0, 1.0), // 2 76 42,
      appBar: AppBar(
        title: Text(
          GlobalStatics.entrada ? "Portaria - Entrada" : "Portaria - Saída",
          style: TextStyle(fontFamily: "WorkSansMedium", fontSize: 25),
        ),
        backgroundColor: GlobalStatics.entrada
            ? Color.fromRGBO(2, 76, 42, 1.0)
            : Color.fromRGBO(106, 0, 0, 1.0),
        elevation: 0,
      ),
      body: Center(
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
                  height: 420,
                  child: Column(
                    children: [
                      _textField(
                          _controllerNome, "Nome", FontAwesomeIcons.user),
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
                      _textField(
                          _controllerCidade, "Cidade", FontAwesomeIcons.city),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      _textField(
                          _controllerTipo, "Tipo", FontAwesomeIcons.idBadge),
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
                  child: ElevatedButton(
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(25)),
                      // color: Colors.orange,
                      // disabledColor: Colors.orange.withAlpha(120),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.qrcode,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Ler",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: "WorkSansMedium",
                            ),
                          )
                        ],
                      ),
                      onPressed: () async {
                        String result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QRViewExample(),
                          ),
                        );
                        if (result != "") {
                          _getVisitante(result);
                        }
                      }),
                ),
                SizedBox(
                  height: 0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: 50,
                  child: ElevatedButton(
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(25)),
                    // color: Colors.orange,
                    // disabledColor: Colors.orange.withAlpha(120),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.save,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Gravar",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: "WorkSansMedium",
                          ),
                        ),
                      ],
                    ),
                    onPressed: visitante != null ? _gravaVisita : null,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
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
            visitante = Visitante.fromJson(element);
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
    Uri url;
    if (GlobalStatics.entrada) {
      url = getUrlGravarEntrada(visitante!.id!);
    } else {
      url = getUrlGravarSaida(visitante!.id!);
    }
    response = await http.get(url);

    if (response.statusCode == 200) {
      if (response.body.toString() == "1") {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          text: GlobalStatics.entrada ? "Entrada Liberada" : "Saída Liberada",
          title: GlobalStatics.entrada ? "Bem-Vindo" : "Até Logo",
        );

        setState(() {
          visitante = null;
        });
      } else {
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: "Ops, algo deu errado!",
            text: response.body.toString());
      }
    } else {
      CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: "Servidor inacessível",
          text: "Tente novamente");
    }
  }
}
