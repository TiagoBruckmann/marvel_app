// import dos pacotes
import 'package:equatable/equatable.dart';

class ComicEntity extends Equatable {

  final String name;

  const ComicEntity( this.name );

  @override
  List<Object?> get props => [name];
}