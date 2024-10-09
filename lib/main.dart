import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_web/0_data/repositories/todo_repo_mock.dart';
import 'package:todo_app_web/1_domain/repositories/todo_repository.dart';

import '2_application/app/main_app.dart';

void main() {
  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(RepositoryProvider<TodoRespository>(
    create: (context) => TodoRespositoryMock(),
    child: const MyApp(),
  ));
}
