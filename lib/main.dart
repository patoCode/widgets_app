import 'package:flutter/material.dart';
import 'package:widgets_app/config/router/router_app.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //** En materiaApp se debe si o si agregar el <.router>
    return MaterialApp.router(
      title: 'Flutter - Widgets App',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(
        selectedColor: 4,
      ).getTheme(),
    );
  }
}
