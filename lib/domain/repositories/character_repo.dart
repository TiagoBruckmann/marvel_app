// import dos domain
import 'package:teste_softdesign/domain/entities/character.dart';
import 'package:teste_softdesign/domain/failures/failure.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

abstract class CharacterRepo {
  Future<Either<Failure, List<CharacterEntity>>> getCharacters();
}