import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();
}

//General failures
class ServerException extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CacheException extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}
