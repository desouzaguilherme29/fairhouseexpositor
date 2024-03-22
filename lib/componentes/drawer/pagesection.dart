import 'package:fairhouseexpositor/componentes/drawer/page_tile.dart';
import 'package:fairhouseexpositor/stores/page_store.dart';
import 'package:fairhouseexpositor/stores/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

class PageSection extends StatelessWidget {
  final PageStore pageStore = GetIt.I<PageStore>();
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Início',
          iconData: FontAwesomeIcons.barcode,
          onTap: () {
            pageStore.setPage(0);
          },
          highlighted: pageStore.page == 0,
        ),
        PageTile(
          label: 'Meus visitantes',
          iconData: FontAwesomeIcons.userTag,
          onTap: () {
            pageStore.setPage(1);
          },
          highlighted: pageStore.page == 1,
        ),
        PageTile(
          label: 'Indicadores',
          iconData: FontAwesomeIcons.list,
          onTap: () {
            pageStore.setPage(2);
          },
          highlighted: pageStore.page == 2,
        ),
        PageTile(
          label: 'Visitando agora',
          iconData: FontAwesomeIcons.userClock,
          onTap: () {
            pageStore.setPage(5);
          },
          highlighted: pageStore.page == 5,
        ),
        PageTile(
          label: 'Todos os visitantes',
          iconData: FontAwesomeIcons.userGroup,
          onTap: () {
            pageStore.setPage(3);
          },
          highlighted: pageStore.page == 3,
        ),
      ],
    );
  }
}
