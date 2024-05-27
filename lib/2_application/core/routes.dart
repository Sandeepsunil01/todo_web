import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_web/2_application/app/pages/dashboard/dashboard_page.dart';
import 'package:todo_app_web/2_application/app/pages/home/home_page.dart';
import 'package:todo_app_web/2_application/app/pages/overview/overview_page.dart';
import 'package:todo_app_web/2_application/app/pages/settings/settings_page.dart';

final GlobalKey<NavigatorState> _rootNavigator =
    GlobalKey<NavigatorState>(debugLabel: "root");

final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey<NavigatorState>(debugLabel: "shell");

const String _basePath = "/home";

final routes = GoRouter(
  navigatorKey: _rootNavigator,
  initialLocation: "$_basePath/dashboard",
  observers: [RouteObserver()],
  routes: [
    // GoRoute(
    //     path: "$_basePath/dashboard",
    //     builder: ((context, state) => const DashboardPage())),
    // GoRoute(
    //     path: "$_basePath/overview",
    //     builder: ((context, state) => const OverviewPage())),
    GoRoute(
        name: SettingsPage.pageConfig.name,
        path: _basePath,
        builder: ((context, state) => const SettingsPage())),
    ShellRoute(
      navigatorKey: _shellNavigator,
      builder: (context, state, child) => child,
      routes: [
        GoRoute(
          name: HomePage.pageConfig.name,
          path: "$_basePath/:tab",
          builder: (context, state) => HomePage(
            key: state.pageKey,
            tab: state.pathParameters["tab"] ?? "",
          ),
        ),
      ],
    ),
    GoRoute(
        path: "$_basePath/dashboard",
        builder: ((context, state) => const DashboardPage())),
    GoRoute(
        path: "$_basePath/overview",
        builder: ((context, state) => const OverviewPage())),
  ],
);
