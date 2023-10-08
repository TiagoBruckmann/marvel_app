// import dos pacotes
import 'package:equatable/equatable.dart';

abstract class Failure {
  final String message = "";
}

class ServerFailure extends Failure with EquatableMixin {
  @override
  List<Object?> get props => [];

}

class GeneralFailure extends Failure with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class UnauthorizedFailure extends Failure with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class MissParamsFailure extends Failure with EquatableMixin {
  @override
  List<Object?> get props => [];
}