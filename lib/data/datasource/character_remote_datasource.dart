// imports nativos
import 'dart:convert';

// imports globais
import 'package:teste_softdesign/session.dart';

// import dos domain
import 'package:teste_softdesign/domain/source/local/injection/injection.dart';

// import dos data
import 'package:teste_softdesign/data/models/character_model.dart';
import 'package:teste_softdesign/data/exceptions/exceptions.dart';

// import dos pacotess
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

abstract class CharactersRemoteDatasource {

  Future<List<CharacterModel>> getCharacters();

}

class CharactersRemoteDatasourceImpl implements CharactersRemoteDatasource {
  final http.Client client;
  CharactersRemoteDatasourceImpl( this.client );

  @override
  Future<List<CharacterModel>> getCharacters({ String? timeStamp }) async {

    Map<String, String> header = {
      "content-Type": "application/json",
    };

    timeStamp = timeStamp ?? DateTime.now().toString().replaceAll("-", "").replaceAll(" ", "").replaceAll(":", "").replaceAll(".", "");
    final hashParse = "$timeStamp${Session.credentials.privateApiKey}${Session.credentials.publicApiKey}";
    final hashApi = md5.convert(utf8.encode(hashParse)).toString();

    final Map<String, String> queryParams = {
      "limit": limit,
      "offset": offset,
      "ts": timeStamp,
      "apikey": Session.credentials.publicApiKey,
      "hash": hashApi,
    };

    Uri url = Uri.https(Session.credentials.apiUrl, Session.credentials.unEncodedPath, queryParams);

    final response = await client.get(
      url,
      headers: header,
    );

    switch ( response.statusCode ) {
      case 200:
        final responseBody = jsonDecode(response.body);
        setPagination(responseBody["data"]);

        List<CharacterModel> list = [];
        for ( final item in responseBody["data"]["results"] )  {
          list.add(
            CharacterModel.fromJson(item),
          );
        }
        return list;

      case 401:
        throw UnauthorizedExceptions();

      case 409:
        throw MissParamsExceptions();

      case 500:
        throw ServerExceptions();

      default:
        throw GeneralExceptions();
    }
  }

}