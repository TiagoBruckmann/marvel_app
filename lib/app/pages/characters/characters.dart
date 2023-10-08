// imports nativos
import 'package:flutter/material.dart';

// import das telas
import 'package:teste_softdesign/app/pages/characters/widgets/loading.dart';
import 'package:teste_softdesign/app/core/widgets/verify_connection.dart';
import 'package:teste_softdesign/app/core/widgets/empty_screen.dart';

// import dos domain
import 'package:teste_softdesign/domain/source/local/mobx/characters/characters.dart';
import 'package:teste_softdesign/domain/entities/character.dart';

// import dos pacotes
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {

  late CharactersMobx _charactersMobx;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _charactersMobx = Provider.of<CharactersMobx>(context);

    _charactersMobx.scrollController.addListener(() {
      if ( _charactersMobx.scrollController.position.maxScrollExtent == _charactersMobx.scrollController.position.pixels ) {
        _charactersMobx.loadMore();
      }
    });

    await _charactersMobx.getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return VerifyConnection(
      keyAppBar: "pages.character.app_bar",
      page: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 8 ),
            child: Observer(
              builder: ( builder ) {

                final theme = Theme.of(builder);

                return RefreshIndicator(
                  onRefresh: () => _charactersMobx.refresh(),
                  child: ( _charactersMobx.isLoading && _charactersMobx.listCharacters.isEmpty )
                  ? const LoadingCharacters()
                  : ( !_charactersMobx.isLoading && _charactersMobx.listCharacters.isEmpty )
                  ? const EmptyScreenWidget(
                    title: "pages.character.empty.list",
                  )
                  : GridView.builder(
                    controller: _charactersMobx.scrollController,
                    itemCount: _charactersMobx.listCharacters.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: ( itemBuilder, index ) {

                      CharacterEntity character = _charactersMobx.listCharacters[index];

                      return GestureDetector(
                        onTap: () => _charactersMobx.goToDetail(character),
                        child: Card(
                          shadowColor: Colors.grey,
                          color: theme.colorScheme.tertiary,
                          child: GridTile(
                            header: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 8, 0),
                              child: Text(
                                "# ${character.id}",
                                textAlign: TextAlign.end,
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                            footer: GridTileBar(
                              backgroundColor: theme.colorScheme.primary.withOpacity(0.8),
                              title: Text(
                                character.name,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.displayMedium,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                character.image,
                              ),
                            ),
                          ),
                        ),
                      );

                    },
                  ),
                );

              },
            ),
          ),
        ),
      ),
    );
  }
}

