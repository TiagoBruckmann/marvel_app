// imports nativos do flutter
import 'package:flutter/material.dart';

// import das telas
import 'package:teste_softdesign/app/core/services/shared.dart';

// imports globais
import 'package:teste_softdesign/domain/source/remote/credentials.dart';

class Session {
  static GlobalKey<NavigatorState> globalContext = GlobalKey<NavigatorState>();

  static final SharedServices sharedServices = SharedServices();
  static final Credentials credentials = Credentials();
}