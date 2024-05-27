import 'package:either_dart/either.dart';
import 'package:todo_app_web/1_domain/entities/todo_collections.dart';

import '../failures/failures.dart';

abstract class TodoRespository {
  Future<Either<Failure, List<TodoCollection>>> readTodoCollection();
}
