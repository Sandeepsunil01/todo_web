import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_web/1_domain/entities/todo_collections.dart';
import 'package:todo_app_web/2_application/app/pages/details/todo_details_page.dart';

class TodoOverviewLoaded extends StatelessWidget {
  const TodoOverviewLoaded({super.key, required this.collections});

  final List<TodoCollection> collections;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: collections.length,
      itemBuilder: (context, index) {
        final item = collections[index];
        final colorScheme = Theme.of(context).colorScheme;
        return ListTile(
          tileColor: colorScheme.surface,
          selectedTileColor: colorScheme.onSurfaceVariant,
          iconColor: item.color.color,
          selectedColor: item.color.color,
          onTap: () {
            if (Breakpoints.small.isActive(context)) {
              context.pushNamed(
                TodoDetailPage.pageConfig.name,
                pathParameters: {"collections": item.id.value},
              );
            }
          },
          leading: const Icon(Icons.circle),
          title: Text(item.title),
        );
      },
    );
  }
}
