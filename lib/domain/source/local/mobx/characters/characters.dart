// import dos pacotes
import 'package:flutter/cupertino.dart';

// imports globais
import 'package:teste_softdesign/session.dart';

// import dos domain
import 'package:teste_softdesign/domain/source/local/injection/injection.dart';
import 'package:teste_softdesign/domain/usecases/character_usecase.dart';
import 'package:teste_softdesign/domain/entities/character.dart';

// import dos pacotes
import 'package:mobx/mobx.dart';

part 'characters.g.dart';

class CharactersMobx extends _CharactersMobx with _$CharactersMobx {}

abstract class _CharactersMobx with Store {

  final CharacterUseCase useCase = CharacterUseCase(getIt());

  ObservableList<CharacterEntity> listCharacters = ObservableList();

  @observable
  ScrollController scrollController = ScrollController();

  @observable
  bool isLoading = false;

  @action
  void setIsLoading( bool value ) => isLoading = value;

  @action
  Future<void> getCharacters() async {
    if ( !isLoading ) {
      setIsLoading(true);
      final failureOrList = await useCase.getCharacters();

      failureOrList.fold(
        (failure) {
          setIsLoading(false);
          listCharacters.clear();
        },
        (success) {
          setIsLoading(false);
          listCharacters.addAll(success);
        },
      );
    }
  }

  @action
  Future<void> loadMore() async {
    if ( listCharacters.length < totalItems ) {
      if ( scrollController.position.maxScrollExtent == scrollController.position.pixels ) {
        await getCharacters();
      }
    }
  }

  @action
  Future<void> refresh() async {
    clearPagination();
    listCharacters.clear();
    await getCharacters();
  }

  @action
  void goToDetail( CharacterEntity character ) {
    Navigator.pushNamed(
      Session.globalContext.currentContext!,
      "/detail",
      arguments: {
        "character": character,
      }
    );
  }

}