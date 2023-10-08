// imports nativos
import 'dart:io';

// import dos testes
import 'character_repo_impl_test.mocks.dart';

// import dos domain
import 'package:teste_softdesign/domain/entities/character.dart';
import 'package:teste_softdesign/domain/failures/failure.dart';

// import dos data
import 'package:teste_softdesign/data/datasource/character_remote_datasource.dart';
import 'package:teste_softdesign/data/repositories/character_repo_impl.dart';
import 'package:teste_softdesign/data/models/character_model.dart';
import 'package:teste_softdesign/data/exceptions/exceptions.dart';

// import dos pacotes
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([MockSpec<CharactersRemoteDatasourceImpl>()])
void main() {

  group('CharacterRepoImpl', () {

    final mockCharacterRemoteDatasource = MockCharactersRemoteDatasourceImpl();
    final characterRepoImplTest = CharacterRepoImpl(mockCharacterRemoteDatasource);

    group('should return CharacterEntity', () {

      test('when characterRemoteDatasource return a List of CharacterModel', () async {

        List<CharacterModel> listCharacters = [
          CharacterModel(
            1010983,
            "Thing (Ultimate)",
            "http://i.annihil.us/u/prod/marvel/i/mg/f/40/4c0032a542533.jpg",
            "When the time came for Reed Richards to demonstrate his teleportation device, his old friend Ben Grimm was invited to observe, but the device malfunctioned and Ben woke up in Mexico City, transformed into a rocky, brutish Thing.",
            const [],
          ),
          CharacterModel(
            1009664,
            "Thor",
            "http://i.annihil.us/u/prod/marvel/i/mg/d/d0/5269657a74350.jpg",
            "As the Norse God of thunder and lightning, Thor wields one of the greatest weapons ever made, the enchanted hammer Mjolnir. While others have described Thor as an over-muscled, oafish imbecile, he's quite smart and compassionate.  He's self-assured, and he would never, ever stop fighting for a worthwhile cause.",
            const [],
          ),
          CharacterModel(
            1017106,
            "Thor (MMA)",
            "http://i.annihil.us/u/prod/marvel/i/mg/2/03/52321948a51f2.jpg",
            "Thor is the Asgardian Prince of Thunder, the son of Odin, and the realm's mightiest warrior. He loves the thrill of battle and is always eager to show off his power to the other Avengers, especially the Hulk. Thor's legendary Uru hammer, Mjolnir, gives him the power to control thunder and the ability to fly. He's found a new home on Earth and will defend it as his own... even if he doesn't understand its sayings and customs.",
            const [],
          ),
        ];

        when(
          mockCharacterRemoteDatasource.getCharacters(),
        ).thenAnswer(
          (realInvocation) => Future.value(listCharacters),
        );

        final result = await characterRepoImplTest.getCharacters();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, List<CharacterModel>>(listCharacters));
        verify(mockCharacterRemoteDatasource.getCharacters()).called(1);
        verifyNoMoreInteractions(mockCharacterRemoteDatasource);

      });

    });

    group('should return left with', () {

      test('A serverFailure when a ServerException occurs', () async {

        when(
          mockCharacterRemoteDatasource.getCharacters(),
        ).thenThrow(ServerExceptions());

        final result = await characterRepoImplTest.getCharacters();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, List<CharacterEntity>>(ServerFailure()));

      });

      test('An UnauthorizedFailure when a UnauthorizedExceptions occurs', () async {

        when(
          mockCharacterRemoteDatasource.getCharacters(),
        ).thenThrow(UnauthorizedExceptions());

        final result = await characterRepoImplTest.getCharacters();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, List<CharacterEntity>>(UnauthorizedFailure()));

      });

      test('A MissParamsFailure when a MissParamsExceptions occurs', () async {

        when(
          mockCharacterRemoteDatasource.getCharacters(),
        ).thenThrow(MissParamsExceptions());

        final result = await characterRepoImplTest.getCharacters();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, List<CharacterEntity>>(MissParamsFailure()));

      });

      test('A GeneralFailure on all another exceptions', () async {

        when(
          mockCharacterRemoteDatasource.getCharacters(),
        ).thenThrow(
          const SocketException("Test"),
        );

        final result = await characterRepoImplTest.getCharacters();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, List<CharacterEntity>>(GeneralFailure()));

      });

    });

  });

}