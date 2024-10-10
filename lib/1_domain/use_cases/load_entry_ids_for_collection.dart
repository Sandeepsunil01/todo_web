import 'package:either_dart/either.dart';
import 'package:todo_app_web/1_domain/entities/unique_id.dart';
import 'package:todo_app_web/1_domain/failures/failures.dart';
import 'package:todo_app_web/1_domain/repositories/todo_repository.dart';
import 'package:todo_app_web/core/use_case.dart';

class LoadEntryIdsForCollection
    implements UseCase<List<EntryId>, CollectiondIdParams> {
  final TodoRespository respository;

  LoadEntryIdsForCollection({required this.respository});

  @override
  Future<Either<Failure, List<EntryId>>> call(
      CollectiondIdParams params) async {
    try {
      final loadedIds = respository.readTodoEntyIds(params.collectionId);
      return loadedIds.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (error) {
      return Left(ServerFailure(stackTrace: error.toString()));
    }
  }
}
