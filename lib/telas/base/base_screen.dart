import 'package:fairhouseexpositor/stores/page_store.dart';
import 'package:fairhouseexpositor/telas/home/home.dart';
import 'package:fairhouseexpositor/telas/indicadores_evento/indicadores_evento.dart';
import 'package:fairhouseexpositor/telas/meus_visitantes/meus_visitantes.dart';
import 'package:fairhouseexpositor/telas/portaria/ambiente.dart';
import 'package:fairhouseexpositor/telas/todos_visitantes/todos_vistantes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  PageController pageController = PageController();

  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  void initState() {
    reaction(
        (_) => pageStore.page, (int page) => pageController.jumpToPage(page));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              Home(),
              MeusVisitantes(),
              IndicadoresEvento(),
              TodosVisitantes(),
              Ambiente(),
            ],
          ),
        ),
        onWillPop: _voltar);
  }

  Future<bool> _voltar() {
    return Future.delayed(const Duration(microseconds: 1), () {
      pageStore.setPage(0);
      return false;
    });
  }
}
