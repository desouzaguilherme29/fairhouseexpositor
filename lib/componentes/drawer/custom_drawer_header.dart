import 'package:fairhouseexpositor/stores/page_store.dart';
import 'package:fairhouseexpositor/stores/user_manager_store.dart';
import 'package:fairhouseexpositor/telas/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:fairhouseexpositor/extensions/extensions.dart';

class CustomDrawerHeader extends StatelessWidget {
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.of(context).pop();
      //   if (userManagerStore.isLoggedIn) {
      //     GetIt.I<PageStore>().setPage(6);
      //   } else {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: (_) => Login(),
      //       ),
      //     );
      //   }
      // },
      child: Container(
        height: 95,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.black,
        child: Row(
          children: [
            Icon(
              Icons.person,
              color: Color.fromRGBO(255, 255, 255, 1.0),
              size: 35,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Observer(builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userManagerStore.isLoggedIn
                          ? userManagerStore.user!.nome!
                              .toLowerCase()
                              .capitalizeFirstofEach
                          : "Acesse sua conta agora!",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "WorkSansMedium",
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${userManagerStore.isLoggedIn ? userManagerStore.user!.evento!.toLowerCase().capitalizeFirstofEach : ""}",
                      style: TextStyle(
                        color: Color.fromRGBO(2, 182, 254, 1.0),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: "WorkSansMedium",
                      ),
                    )
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
