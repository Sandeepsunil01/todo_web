import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_web/1_domain/entities/todo_collections.dart';
import 'package:todo_app_web/1_domain/use_cases/load_todo_collections.dart';
import 'package:todo_app_web/core/use_case.dart';

part 'todo_overview_state.dart';

class TodoOverviewCubit extends Cubit<TodoOverviewState> {
  TodoOverviewCubit(
      {required this.loadTodoCollections, TodoOverviewState? initialState})
      : super(initialState ?? TodoOverviewLoadingState());

  final LoadTodoCollections loadTodoCollections;

  Future<void> readTodoCollections() async {
    emit(TodoOverviewLoadingState());
    try {
      final collectionsFuture = loadTodoCollections.call(NoParams());
      final collections = await collectionsFuture;

      if (collections.isLeft) {
        emit(TodoOverviewErrorState());
      } else {
        emit(TodoOverviewLoadedState(collections: collections.right));
      }
    } on Exception {
      emit(TodoOverviewErrorState());
    }
  }
}
