import 'package:either_dart/either.dart';
import 'package:todo_app_web/1_domain/failures/failures.dart';
import 'package:todo_app_web/1_domain/repositories/todo_repository.dart';
import 'package:todo_app_web/core/use_case.dart';

import '../entities/todo_entry_entity.dart';

class LoadTodoEntry implements UseCase<TodoEntry, TodoEntryIdsParams> {
  final TodoRespository respository;

  LoadTodoEntry({required this.respository});

  @override
  Future<Either<Failure, TodoEntry>> call(TodoEntryIdsParams params) async {
    try {
      final loadedEntry =
          await respository.readTodoEntry(params.collectionId, params.entryId);
      return loadedEntry.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (error) {
      return Left(ServerFailure(stackTrace: error.toString()));
    }
  }
}
