// import dos domain
import 'package:teste_softdesign/domain/entities/character.dart';

// import dos data
import 'package:teste_softdesign/data/models/comic_model.dart';

// import dos pacotes
import 'package:equatable/equatable.dart';

class CharacterModel extends CharacterEntity with EquatableMixin {

  CharacterModel( int id, String name, String image, String description, List<ComicModel> comicList ) : super( id, name, image, description, comicList );

  factory CharacterModel.fromJson( Map<String, dynamic> json ) {

    List<ComicModel> list = [];
    if ( json["comics"] != null ) {
      for ( final item in json["comics"]["items"] ) {
        list.add(
          ComicModel.fromJson(item),
        );
      }
    }

    return CharacterModel(
      json["id"],
      json["name"],
      "${json["thumbnail"]["path"]}.${json["thumbnail"]["extension"]}",
      json["description"],
      list,
    );
  }

  @override
  String toString() => name;
}