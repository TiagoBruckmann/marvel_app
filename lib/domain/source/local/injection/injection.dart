// import do domain
import 'package:teste_softdesign/domain/repositories/character_repo.dart';
import 'package:teste_softdesign/domain/usecases/character_usecase.dart';

// import do data
import 'package:teste_softdesign/data/datasource/character_remote_datasource.dart';
import 'package:teste_softdesign/data/repositories/character_repo_impl.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

int totalItems = 0;
String offset = "0";
String limit = "20";

@InjectableInit()
void configureDependencies() {

  // import das telas
  // getIt.registerFactory(() => ReleasesCubit(getIt()));

  // domain
  getIt.registerFactory(() => CharacterUseCase(getIt()));

  // data
  getIt.registerFactory<CharactersRemoteDatasource>(() => CharactersRemoteDatasourceImpl(getIt()));
  getIt.registerFactory<CharacterRepo>(() => CharacterRepoImpl(getIt()));

  // extern
  getIt.registerFactory(() => http.Client());

}

void setPagination( Map<String, dynamic> json ) {
  totalItems = json["total"];
  offset = (int.parse(offset) + 20).toString();
}

void clearPagination() {
  totalItems = 0;
  offset = "0";
}