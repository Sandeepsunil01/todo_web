import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_web/1_domain/entities/unique_id.dart';
import 'package:todo_app_web/1_domain/failures/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class Params extends Equatable {}

class NoParams extends Params {
  @override
  List<Object?> get props => [];
}

class TodoEntryIdsParams extends Params {
  TodoEntryIdsParams({required this.collectionId, required this.entryId})
      : super();

  final EntryId entryId;
  final CollectionId collectionId;

  @override
  List<Object?> get props => [collectionId, entryId];
}

class CollectiondIdParams extends Params {
  final CollectionId collectionId;

  CollectiondIdParams({required this.collectionId});

  @override
  List<Object?> get props => [collectionId];
}
