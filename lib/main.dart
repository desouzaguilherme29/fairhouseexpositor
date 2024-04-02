import 'dart:io';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fairhouseexpositor/globais/global_statics.dart';
import 'package:fairhouseexpositor/stores/login_store.dart';
import 'package:fairhouseexpositor/stores/page_store.dart';
import 'package:fairhouseexpositor/stores/resumo_stand.dart';
import 'package:fairhouseexpositor/stores/todos_visitantes_feira.dart';
import 'package:fairhouseexpositor/stores/user_manager_store.dart';
import 'package:fairhouseexpositor/stores/visitante_stand.dart';
import 'package:fairhouseexpositor/stores/visitantes_feira.dart';
import 'package:fairhouseexpositor/stores/visitantes_hora_evento.dart';
import 'package:fairhouseexpositor/telas/base/base_screen.dart';
import 'package:fairhouseexpositor/telas/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:page_transition/page_transition.dart';
import 'package:intl/intl.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  setupLocators();
  runApp(MyApp());
  configLoading();
}

void setupLocators() async {
  GetIt.I.registerSingleton(UserManagerStore());
  GetIt.I.registerSingleton(LoginStore());
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(VisitantesFeira());
  GetIt.I.registerSingleton(VisitantesHoraEvento());
  GetIt.I.registerSingleton(ResumoStand());
  GetIt.I.registerSingleton(VisitanteStandStore());
  GetIt.I.registerSingleton(TodosVisitantesFeira());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 1500)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.light
    ..backgroundColor = Colors.grey;
}

class MyApp extends StatelessWidget {
  final hora = int.parse(DateFormat.H().format(DateTime.now()));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      title: "FairHouse",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.orange),
          elevation: 0,
          backgroundColor: Colors.black,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            fontFamily: "WorkSansMedium",
          ),
        ),
        scaffoldBackgroundColor: Colors.black,
      ),
      localizationsDelegates: [

      ],
      home: AnimatedSplashScreen.withScreenFunction(
        splash: "imagens/logo_fairhouse.png",
        splashIconSize: 80,
        screenFunction: () async {
          if (hora >= 7 && hora < 12) {
            GlobalStatics.saudacao = "Bom dia";
          } else if (hora >= 12 && hora < 18) {
            GlobalStatics.saudacao = "Boa tarde";
          } else {
            GlobalStatics.saudacao = "Boa noite";
          }

          if (GetIt.I<UserManagerStore>().isLoggedIn) {
            return BaseScreen();
          } else {
            return Login();
          }
        },
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.black45,
      ),
    );
  }
}
