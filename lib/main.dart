// imports nativos
import 'package:flutter/material.dart';

// imports globais
import 'package:teste_softdesign/session.dart';

// import dos app
import 'package:teste_softdesign/app/core/services/languages.dart';
import 'package:teste_softdesign/app/core/routes/routes.dart';
import 'package:teste_softdesign/app/core/style/themes.dart';

// import dos domain
import 'package:teste_softdesign/domain/source/local/mobx/connection/connection.dart';
import 'package:teste_softdesign/domain/source/local/mobx/characters/characters.dart';
import 'package:teste_softdesign/domain/source/local/injection/injection.dart';

// import dos pacotes
import 'package:provider/provider.dart';

Future<void> main() async {

  configureDependencies();

  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => ConnectionMobx(),
        ),
        Provider(
          create: (context) => CharactersMobx(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: Session.globalContext,
        title: "Teste SoftDesign",
        theme: Themes.lightTheme,
        onGenerateRoute: Routes.generateRoutes,
        initialRoute: "/splash",
        supportedLocales: supportedLocale,
        localizationsDelegates: localizationsDelegate,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}