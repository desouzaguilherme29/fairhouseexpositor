import 'package:fairhouseexpositor/componentes/drawer/custom_drawer_header.dart';
import 'package:fairhouseexpositor/componentes/drawer/pagesection.dart';
import 'package:fairhouseexpositor/stores/page_store.dart';
import 'package:fairhouseexpositor/stores/user_manager_store.dart';
import 'package:fairhouseexpositor/telas/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

class CustomDrawer extends StatelessWidget {
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();
  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.65,
        child: Drawer(
          child: Container(
            color: Colors.black12,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      CustomDrawerHeader(),
                      PageSection(),
                    ],
                  ),
                ),
                Observer(
                  builder: (_) {
                    if (userManagerStore.isLoggedIn) {
                      return ListTile(
                        leading: Icon(
                          FontAwesomeIcons.signOutAlt,
                          color: Colors.red,
                        ),
                        title: Text(
                          "Logout",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w700,
                            fontFamily: "WorkSansMedium",
                          ),
                        ),
                        onTap: () {
                          userManagerStore.logoutUser();

                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ),
                            );

                        },
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
