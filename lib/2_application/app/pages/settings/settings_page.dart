import 'package:flutter/material.dart';
import 'package:todo_app_web/2_application/core/page_config.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.settings,
    name: "settings",
    child: SettingsPage(),
  );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
