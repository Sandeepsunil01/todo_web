import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_web/2_application/app/pages/dashboard/dashboard_page.dart';
import 'package:todo_app_web/2_application/app/pages/overview/overview_page.dart';
import 'package:todo_app_web/2_application/core/page_config.dart';

import '../settings/settings_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required String tab})
      : index = tabs.indexWhere((element) => element.name == tab);

  final int index;

  static const PageConfig pageConfig = PageConfig(
    icon: Icons.home,
    name: "/home",
  );

  static const tabs = [
    DashboardPage.pageConfig,
    OverviewPage.pageConfig,
  ];

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final destination = HomePage.tabs
      .map((page) =>
          NavigationDestination(icon: Icon(page.icon), label: page.name))
      .toList();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        body: SafeArea(
      child: AdaptiveLayout(
        primaryNavigation: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.mediumAndUp: SlotLayout.from(
              key: const Key('primary-navigation-medium'),
              builder: (context) => AdaptiveScaffold.standardNavigationRail(
                  trailing: IconButton(
                    icon: Icon(SettingsPage.pageConfig.icon),
                    onPressed: () {
                      context.pushNamed(SettingsPage.pageConfig.name);
                    },
                  ),
                  selectedIconTheme:
                      IconThemeData(color: theme.colorScheme.background),
                  selectedLabelTextStyle:
                      TextStyle(color: theme.colorScheme.background),
                  onDestinationSelected: (index) =>
                      _tapOnNavigationDestination(context, index),
                  destinations: destination
                      .map((_) => AdaptiveScaffold.toRailDestination(_))
                      .toList(),
                  selectedIndex: widget.index),
            )
          },
        ),
        bottomNavigation: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.small: SlotLayout.from(
              key: const Key("bottom-navigation-small"),
              builder: (_) => AdaptiveScaffold.standardBottomNavigationBar(
                iconSize: 20,
                destinations: destination,
                onDestinationSelected: (index) =>
                    _tapOnNavigationDestination(context, index),
                currentIndex: widget.index,
              ),
            )
          },
        ),
        body: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.smallAndUp: SlotLayout.from(
            key: const Key('primary-body-small'),
            builder: (_) => HomePage.tabs[widget.index].child,
          )
        }),
        secondaryBody: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.mediumAndUp: SlotLayout.from(
            key: const Key('primary-body-medium'),
            builder: AdaptiveScaffold.emptyBuilder,
          )
        }),
      ),
    ));
  }

  void _tapOnNavigationDestination(BuildContext context, int index) {
    context.goNamed(HomePage.pageConfig.name,
        pathParameters: {"tab": HomePage.tabs[index].name});
  }
}
