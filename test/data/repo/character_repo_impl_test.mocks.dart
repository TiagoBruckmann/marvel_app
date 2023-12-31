// Mocks generated by Mockito 5.4.2 from annotations
// in teste_softdesign/test/data/repo/character_repo_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:teste_softdesign/data/datasource/character_remote_datasource.dart'
    as _i3;
import 'package:teste_softdesign/data/models/character_model.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeClient_0 extends _i1.SmartFake implements _i2.Client {
  _FakeClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CharactersRemoteDatasourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockCharactersRemoteDatasourceImpl extends _i1.Mock
    implements _i3.CharactersRemoteDatasourceImpl {
  @override
  _i2.Client get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _FakeClient_0(
          this,
          Invocation.getter(#client),
        ),
        returnValueForMissingStub: _FakeClient_0(
          this,
          Invocation.getter(#client),
        ),
      ) as _i2.Client);

  @override
  _i4.Future<List<_i5.CharacterModel>> getCharacters({String? timeStamp}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCharacters,
          [],
          {#timeStamp: timeStamp},
        ),
        returnValue:
            _i4.Future<List<_i5.CharacterModel>>.value(<_i5.CharacterModel>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i5.CharacterModel>>.value(<_i5.CharacterModel>[]),
      ) as _i4.Future<List<_i5.CharacterModel>>);
}
