import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_web/1_domain/use_cases/load_todo_collections.dart';
import 'package:todo_app_web/2_application/app/pages/overview/cubit/todo_overview_cubit.dart';
import 'package:todo_app_web/2_application/app/pages/overview/view_states/todo_overview_error.dart';
import 'package:todo_app_web/2_application/app/pages/overview/view_states/todo_overview_loaded.dart';
import 'package:todo_app_web/2_application/app/pages/overview/view_states/todo_overview_loading.dart';
import 'package:todo_app_web/2_application/core/page_config.dart';

class TodoOverviewPageProvider extends StatelessWidget {
  const TodoOverviewPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoOverviewCubit(
        loadTodoCollections: LoadTodoCollections(
          todoRespository: RepositoryProvider.of(context),
        ),
      )..readTodoCollections(),
      child: const OverviewPage(),
    );
  }
}

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.view_agenda,
    name: "overview",
    child: TodoOverviewPageProvider(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.tealAccent,
      child: BlocBuilder<TodoOverviewCubit, TodoOverviewState>(
          builder: (context, state) {
        if (state is TodoOverviewLoadingState) {
          return const TodoOverviewLoading();
        } else if (state is TodoOverviewLoadedState) {
          return TodoOverviewLoaded(collections: state.collections);
        } else {
          return const TodoOverviewError();
        }
      }),
    );
  }
}
