// import dos domain
import 'package:teste_softdesign/domain/repositories/character_repo.dart';
import 'package:teste_softdesign/domain/entities/character.dart';
import 'package:teste_softdesign/domain/failures/failure.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

class CharacterUseCase {
  final CharacterRepo characterRepo;
  CharacterUseCase( this.characterRepo );

  Future<Either<Failure, List<CharacterEntity>>> getCharacters() async {
    return characterRepo.getCharacters();
  }

}