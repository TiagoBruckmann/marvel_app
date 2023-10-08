// import dos domain
import 'package:teste_softdesign/domain/entities/comic.dart';

// import dos pacotes
import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {

  final int id;
  final String name, image, description;
  final List<ComicEntity> comicList;

  const CharacterEntity( this.id, this.name, this.image, this.description,this.comicList );

  @override
  List<Object?> get props => [id, name, image, description, comicList];
}