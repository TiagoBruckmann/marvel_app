// imports nativos do flutter
import 'package:flutter/material.dart';

// import do app
import 'package:teste_softdesign/app/pages/characters/characters.dart';
import 'package:teste_softdesign/app/pages/characters/detail.dart';
import 'package:teste_softdesign/app/pages/splash.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

class Routes {

  static Route<dynamic>? generateRoutes(RouteSettings settings) {

    final args = settings.arguments;

    switch( settings.name ) {
      case "/splash":
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
      case "/":
        return MaterialPageRoute(
          builder: (_) => const CharactersPage(),
        );
      case "/detail":
        final params = args as Map;
        return MaterialPageRoute(
          builder: (_) => DetailCharacterPage(
            character: params["character"],
          ),
        );
      default:
        _errorRoute();
    }
    return null;

  }

  static Route<dynamic> _errorRoute() {

    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          backgroundColor: Theme.of(_).colorScheme.background,
          appBar: AppBar(
            title: Text(
              FlutterI18n.translate(_, "routes.app_bar"),
              style: TextStyle(
                color: Theme.of(_).secondaryHeaderColor,
              ),
            ),
          ),
          body: Center(
            child: Text(
              FlutterI18n.translate(_, "routes.app_bar"),
            ),
          ),
        );
      },
    );

  }
}