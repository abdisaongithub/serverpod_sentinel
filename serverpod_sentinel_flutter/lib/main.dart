import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'router.dart';
import 'theme/app_theme.dart';

void main() {
  usePathUrlStrategy();
  runApp(const OpsPilotApp());
}

class OpsPilotApp extends StatelessWidget {
  const OpsPilotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'OpsPilot',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: router,
    );
  }
}
