// imports nativos
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

// import dos test
import 'character_remote_datasource_test.mocks.dart';

// import dos data
import 'package:teste_softdesign/data/datasource/character_remote_datasource.dart';
import 'package:teste_softdesign/data/models/character_model.dart';
import 'package:teste_softdesign/data/exceptions/exceptions.dart';

// import dos pacotes
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:crypto/crypto.dart';
import 'package:test/test.dart';
import 'package:http/http.dart';

@GenerateNiceMocks([MockSpec<Client>()])
void main() {

  WidgetsFlutterBinding.ensureInitialized();

  group('CharacterRemoteDatasource', () {

    final mockClient = MockClient();
    final characterRemoteDataSourceTest = CharactersRemoteDatasourceImpl(mockClient);

    const publicApiKey = "ed84c9c84de7716fcc19e9db6920544b";
    const privateApiKey = "7e6caee9aaa5adfdc4526cbf0c598702dd7acbc9";

    final timeStamp = DateTime.now().toString().replaceAll("-", "").replaceAll(" ", "").replaceAll(":", "").replaceAll(".", "");
    final hashParse = "$timeStamp$privateApiKey$publicApiKey";
    final hashApi = md5.convert(utf8.encode(hashParse)).toString();

    final Map<String, String> queryParams = {
      "limit": "20",
      "offset": "0",
      "ts": timeStamp,
      "apikey": publicApiKey,
      "hash": hashApi,
    };

    Uri url = Uri.https("gateway.marvel.com", "v1/public/characters", queryParams);


    group('should throw', () {

      test('An UnauthorizedExceptions when Client response is 401 and has no valid data', () {

        when(
          mockClient.get(
            url,
            headers: {
              "content-Type": "application/json",
            },
          ),
        ).thenAnswer((realInvocation) => Future.value(
          Response('The passed API key is invalid.', 401),
        ));

        expect(characterRemoteDataSourceTest.getCharacters(timeStamp: timeStamp), throwsA(isA<UnauthorizedExceptions>()));

      });

      test('A MissParamsExceptions when Client response is 409 and has no valid data', () {

        when(
          mockClient.get(
            url,
            headers: {
              "content-Type": "application/json",
            },
          ),
        ).thenAnswer((realInvocation) => Future.value(
          Response('You must provide a user key.', 409),
        ));

        expect(characterRemoteDataSourceTest.getCharacters(timeStamp: timeStamp), throwsA(isA<MissParamsExceptions>()));

      });

      test('A serverException when Client response is 500 and has no valid data', () {

        when(
          mockClient.get(
            url,
            headers: {
              "content-Type": "application/json",
            },
          ),
        ).thenAnswer((realInvocation) => Future.value(
          Response('Internal server error', 500),
        ));

        expect(characterRemoteDataSourceTest.getCharacters(timeStamp: timeStamp), throwsA(isA<ServerExceptions>()));

      });

      test('A GeneralExceptions when Client response is another status_code and has no valid data', () {

        when(
          mockClient.get(
            url,
            headers: {
              "content-Type": "application/json",
            },
          ),
        ).thenAnswer((realInvocation) => Future.value(
          Response('API URL not found', 404),
        ));

        expect(characterRemoteDataSourceTest.getCharacters(timeStamp: timeStamp), throwsA(isA<GeneralExceptions>()));

      });

    });

    group("should return a List of CharacterModel", () {
      test("When client response was 200 and has valid data", () async {

        String responseBody = await rootBundle.loadString("assets/test/fake_response.txt");

        when(
          mockClient.get(
            url,
            headers: {
              "content-Type": "application/json",
            },
          ),
        ).thenAnswer((realInvocation) => Future.value(
          Response(responseBody, 200),
        ));

        final response = await characterRemoteDataSourceTest.getCharacters(timeStamp: timeStamp);

        final data = jsonDecode(responseBody);
        List<CharacterModel> listCharacters = [];
        for ( final item in data["data"]["results"] )  {
          listCharacters.add(
            CharacterModel.fromJson(item),
          );
        }

        expect(response, listCharacters);

      });
    });

  });
}