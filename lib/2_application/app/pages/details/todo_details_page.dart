import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_web/1_domain/entities/unique_id.dart';
import 'package:todo_app_web/1_domain/repositories/todo_repository.dart';
import 'package:todo_app_web/1_domain/use_cases/load_entry_ids_for_collection.dart';
import 'package:todo_app_web/1_domain/use_cases/load_todo_collections.dart';
import 'package:todo_app_web/2_application/app/pages/details/cubit/details_cubit.dart';
import 'package:todo_app_web/2_application/app/pages/details/view_states/todo_details_error.dart';
import 'package:todo_app_web/2_application/app/pages/details/view_states/todo_details_loaded.dart';
import 'package:todo_app_web/2_application/app/pages/details/view_states/todo_details_loading.dart';
import 'package:todo_app_web/2_application/core/page_config.dart';

class TodoDetailsPageProvider extends StatelessWidget {
  const TodoDetailsPageProvider({super.key, required this.collectionId});

  final CollectionId collectionId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsCubit>(
      create: (context) => DetailsCubit(
        collectionId: collectionId,
        loadTodoEntryIdsForCollections: LoadEntryIdsForCollection(
          respository: RepositoryProvider.of<TodoRespository>(context),
        ),
      )..fetch(),
      child: TodoDetailPage(
        collectionId: collectionId,
      ),
    );
  }
}

class TodoDetailPage extends StatelessWidget {
  const TodoDetailPage({super.key, required this.collectionId});

  final CollectionId collectionId;

  static const pageConfig = PageConfig(
    icon: Icons.details_rounded,
    name: 'details',
    child: Placeholder(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state is DetailsLoading) {
          return const TodoDetailsLoading();
        } else if (state is DetailsLoaded) {
          return TodoDetailsLoaded(
            entryIds: state.entryIds,
            collectionId: collectionId,
          );
        } else {
          return const TodoDetailsError();
        }
      },
    );
  }
}
