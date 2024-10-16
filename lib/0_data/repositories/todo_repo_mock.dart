import 'package:either_dart/either.dart';
import 'package:todo_app_web/1_domain/entities/todo_collections.dart';
import 'package:todo_app_web/1_domain/entities/todo_color.dart';
import 'package:todo_app_web/1_domain/entities/todo_entry_entity.dart';
import 'package:todo_app_web/1_domain/entities/unique_id.dart';
import 'package:todo_app_web/1_domain/failures/failures.dart';
import 'package:todo_app_web/1_domain/repositories/todo_repository.dart';

class TodoRespositoryMock implements TodoRespository {
  final List<TodoEntry> todoEntries = List<TodoEntry>.generate(
    100,
    (index) => TodoEntry(
      id: EntryId.fromUniqueString(index.toString()),
      decription: 'Description $index',
      isDone: false,
    ),
  );

  final collections = List<TodoCollection>.generate(
    10,
    (index) => TodoCollection(
      id: CollectionId.fromUniqueString(index.toString()),
      title: 'title $index',
      color: TodoColor(colorIndex: index % TodoColor.predefinedColors.length),
    ),
  );

  @override
  Future<Either<Failure, List<TodoCollection>>> readTodoCollection() {
    try {
      return Future.delayed(
        const Duration(milliseconds: 200),
        () => Right(collections),
      );
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, TodoEntry>> readTodoEntry(
      CollectionId collectionId, EntryId entityId) {
    try {
      final selectedEntryItem =
          todoEntries.firstWhere((element) => element.id == entityId);
      return Future.delayed(
        const Duration(milliseconds: 300),
        () => Right(selectedEntryItem),
      );
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<EntryId>>> readTodoEntyIds(
      CollectionId collectionId) {
    try {
      final startIndex = int.parse(collectionId.value) * 10;
      final endIndex = startIndex + 10;
      final entryId = todoEntries
          .sublist(startIndex, endIndex)
          .map((entry) => entry.id)
          .toList();
      return Future.delayed(
        const Duration(milliseconds: 300),
        () => Right(entryId),
      );
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }
}
