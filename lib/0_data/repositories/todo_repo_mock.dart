import 'package:either_dart/either.dart';
import 'package:todo_app_web/1_domain/entities/todo_collections.dart';
import 'package:todo_app_web/1_domain/entities/todo_color.dart';
import 'package:todo_app_web/1_domain/entities/unique_id.dart';
import 'package:todo_app_web/1_domain/failures/failures.dart';
import 'package:todo_app_web/1_domain/repositories/todo_repository.dart';

class TodoRespositoryMock implements TodoRespository {
  @override
  Future<Either<Failure, List<TodoCollection>>> readTodoCollection() {
    final list = List<TodoCollection>.generate(
      10,
      (index) => TodoCollection(
        id: CollectionId.fromUniqueString(index.toString()),
        title: 'title $index',
        color: TodoColor(colorIndex: index % TodoColor.predefinedColors.length),
      ),
    );

    return Future.delayed(
      const Duration(milliseconds: 200),
      () => Right(list),
    );
  }
}
