// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharactersMobx on _CharactersMobx, Store {
  late final _$scrollControllerAtom =
      Atom(name: '_CharactersMobx.scrollController', context: context);

  @override
  ScrollController get scrollController {
    _$scrollControllerAtom.reportRead();
    return super.scrollController;
  }

  @override
  set scrollController(ScrollController value) {
    _$scrollControllerAtom.reportWrite(value, super.scrollController, () {
      super.scrollController = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CharactersMobx.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$getCharactersAsyncAction =
      AsyncAction('_CharactersMobx.getCharacters', context: context);

  @override
  Future<void> getCharacters() {
    return _$getCharactersAsyncAction.run(() => super.getCharacters());
  }

  late final _$loadMoreAsyncAction =
      AsyncAction('_CharactersMobx.loadMore', context: context);

  @override
  Future<void> loadMore() {
    return _$loadMoreAsyncAction.run(() => super.loadMore());
  }

  late final _$refreshAsyncAction =
      AsyncAction('_CharactersMobx.refresh', context: context);

  @override
  Future<void> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  late final _$_CharactersMobxActionController =
      ActionController(name: '_CharactersMobx', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_CharactersMobxActionController.startAction(
        name: '_CharactersMobx.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_CharactersMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToDetail(CharacterEntity character) {
    final _$actionInfo = _$_CharactersMobxActionController.startAction(
        name: '_CharactersMobx.goToDetail');
    try {
      return super.goToDetail(character);
    } finally {
      _$_CharactersMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scrollController: ${scrollController},
isLoading: ${isLoading}
    ''';
  }
}
