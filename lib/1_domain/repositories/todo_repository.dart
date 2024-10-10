import 'package:either_dart/either.dart';
import 'package:todo_app_web/1_domain/entities/todo_collections.dart';
import 'package:todo_app_web/1_domain/entities/todo_entry_entity.dart';
import 'package:todo_app_web/1_domain/entities/unique_id.dart';

import '../failures/failures.dart';

abstract class TodoRespository {
  Future<Either<Failure, List<TodoCollection>>> readTodoCollection();

  Future<Either<Failure, TodoEntry>> readTodoEntry(
      CollectionId collectionId, EntryId entityId);

  Future<Either<Failure, List<EntryId>>> readTodoEntyIds(
      CollectionId collectionId);
}
