// imports nativos
import 'package:flutter/material.dart';

// import das telas
import 'package:teste_softdesign/app/core/style/app_images.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

class EmptyScreenWidget extends StatelessWidget {
  final String title;
  const EmptyScreenWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ThemeData theme = Theme.of(context);
    double width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            AppImages.allHeroes,
            width: width,
          ),
        ),

        Padding(
          padding: const EdgeInsets.only( top: 15 ),
          child: Text(
            FlutterI18n.translate(context, title),
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineLarge,
          ),
        ),

      ],
    );
  }
}