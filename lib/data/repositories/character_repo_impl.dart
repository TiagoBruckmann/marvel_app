// import dos domain
import 'package:teste_softdesign/domain/repositories/character_repo.dart';
import 'package:teste_softdesign/domain/failures/failure.dart';

// import dos data
import 'package:teste_softdesign/data/datasource/character_remote_datasource.dart';
import 'package:teste_softdesign/data/models/character_model.dart';
import 'package:teste_softdesign/data/exceptions/exceptions.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

class CharacterRepoImpl implements CharacterRepo {
  final CharactersRemoteDatasource charactersRemoteDatasource;
  CharacterRepoImpl(this.charactersRemoteDatasource);

  @override
  Future<Either<Failure, List<CharacterModel>>> getCharacters() async {
    try {
      final result = await charactersRemoteDatasource.getCharacters();
      return right(result);
    } on ServerExceptions {
      return left(ServerFailure());
    } on UnauthorizedExceptions {
      return left(UnauthorizedFailure());
    } on MissParamsExceptions {
      return left(MissParamsFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }

}