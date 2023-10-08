// import dos domain
import 'package:teste_softdesign/domain/entities/comic.dart';

// import dos pacotes
import 'package:equatable/equatable.dart';

class ComicModel extends ComicEntity with EquatableMixin {

  ComicModel( String name ) : super(name);

  factory ComicModel.fromJson( Map<String, dynamic> json ) {
    return ComicModel(
      json["name"],
    );
  }

}