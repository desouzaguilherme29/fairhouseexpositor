import 'package:fairhouseexpositor/componentes/components.dart';
import 'package:fairhouseexpositor/componentes/drawer/drawer.dart';
import 'package:fairhouseexpositor/globais/global_statics.dart';
import 'package:fairhouseexpositor/telas/portaria/portaria.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum SingingCharacter { Entrada, Saida }

class Ambiente extends StatefulWidget {
  @override
  _AmbienteState createState() => _AmbienteState();
}

class _AmbienteState extends State<Ambiente> {
  SingingCharacter _character = SingingCharacter.Entrada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          "Escolha a operação",
          style: TextStyle(
            fontFamily: "WorkSansMedium",
            fontSize: 25,
          ),
        ),
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
                  padding: EdgeInsets.all(25),
                  height: 170,
                  color: Colors.white,
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
      ),
    );
  }

  _entrar() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Portaria(),
      ),
    );
  }
}
