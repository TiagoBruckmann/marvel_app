// imports nativos
import 'package:flutter/material.dart';

// import das telas
import 'package:teste_softdesign/app/core/widgets/verify_connection.dart';

// import dos domain
import 'package:teste_softdesign/domain/entities/character.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

class DetailCharacterPage extends StatelessWidget {
  final CharacterEntity character;
  const DetailCharacterPage({ super.key, required this.character });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return VerifyConnection(
      keyAppBar: character.name,
      page: Card(
        elevation: 0,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 8 ),
          child: Column(
            children: [

              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  character.image,
                ),
              ),

              if ( character.description.trim().isNotEmpty )
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only( top: 8 ),
                    child: Text(
                      character.name,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.displayMedium,
                    ),
                  ),
                  subtitle: Column(
                    children: [

                      const Divider(),

                      Text(
                        character.description,
                        style: theme.textTheme.labelMedium,
                      ),

                    ],
                  ),
                ),

              if ( character.comicList.isNotEmpty )
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only( top: 8 ),
                    child: Text(
                      FlutterI18n.translate(context, "pages.character.comic"),
                      textAlign: TextAlign.center,
                      style: theme.textTheme.displayMedium,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Divider(),

                      for ( final item in character.comicList )
                        Padding(
                          padding: const EdgeInsets.symmetric( vertical: 3 ),
                          child: Text(
                            item.name,
                            style: theme.textTheme.labelMedium,
                          ),
                        ),

                    ],
                  ),
                ),

              if ( character.description.trim().isEmpty && character.comicList.isEmpty )
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only( top: 8 ),
                    child: Text(
                      FlutterI18n.translate(context, "pages.character.empty.data"),
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelMedium,
                    ),
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}
