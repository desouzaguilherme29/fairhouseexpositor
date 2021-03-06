import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fairhouseexpositor/globais/global_statics.dart';
import 'package:fairhouseexpositor/models/VisitantesHora.dart';
import 'package:fairhouseexpositor/models/url_service.dart';
import 'package:fairhouseexpositor/stores/page_store.dart';
import 'package:fairhouseexpositor/stores/resumo_stand.dart';
import 'package:fairhouseexpositor/stores/user_manager_store.dart';
import 'package:fairhouseexpositor/stores/visitante_stand.dart';
import 'package:fairhouseexpositor/stores/visitantes_feira.dart';
import 'package:fairhouseexpositor/stores/visitantes_hora_evento.dart';
import 'package:fairhouseexpositor/telas/base/base_screen.dart';
import 'package:fairhouseexpositor/telas/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocators();
  runApp(MyApp());
}

void setupLocators() async {
  GetIt.I.registerSingleton(PageStore());
  await GetIt.I.registerSingleton(UserManagerStore());
  await Future.delayed(Duration(seconds: 5));
  GetIt.I.registerSingleton(VisitanteStandStore());
  GetIt.I.registerSingleton(VisitantesFeira());
  GetIt.I.registerSingleton(VisitantesHoraEvento());
  GetIt.I.registerSingleton(ResumoStand());
}

class MyApp extends StatelessWidget {
  final hora = int.parse(DateFormat.H().format(DateTime.now()));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FairHouse Expositores",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.black45,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            fontFamily: "WorkSansMedium",
          ),
        ),
        scaffoldBackgroundColor: Colors.black45,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
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
