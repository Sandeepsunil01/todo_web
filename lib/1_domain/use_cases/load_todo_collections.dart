import 'package:either_dart/either.dart';
import 'package:todo_app_web/1_domain/failures/failures.dart';
import 'package:todo_app_web/1_domain/repositories/todo_repository.dart';
import 'package:todo_app_web/core/use_case.dart';

import '../entities/todo_collections.dart';

class LoadTodoCollections implements UseCase<List<TodoCollection>, NoParams> {
  final TodoRespository todoRespository;

  LoadTodoCollections({required this.todoRespository});

  @override
  Future<Either<Failure, List<TodoCollection>>> call(NoParams params) async {
    try {
      final loadedCollections = todoRespository.readTodoCollection();

      return loadedCollections.fold(
          (left) => Left(left), (right) => Right(right));
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
