import 'package:flutter/material.dart';
import 'package:todo_app_web/2_application/core/page_config.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.view_agenda,
    name: "overview",
    child: OverviewPage(),
  );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
