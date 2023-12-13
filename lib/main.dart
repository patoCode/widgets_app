import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/router_app.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(
    // ** <ProviderScope> Con este widget RIVERPOD ya sabe donde buscar los providers
    // ** Simpre debe estar incluido en esta seccion, despues de instalar <flutter_riverpod>
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //** En materiaApp se debe si o si agregar el <.router>

    final isDark = ref.watch(themeProvider);
    final selectColor = ref.watch(selectedIndexColorProvider);

    // ** Definimos el controlador de estado para controlar el theme
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      title: 'Flutter - Widgets App',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      // ** usaremos este estado para inicializar el theme
      theme: appTheme.getTheme(),
    );
  }
}
