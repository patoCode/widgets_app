import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const String name = 'theme_changer_screeen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ** Esto sirve para el control conestados simples
    // final isDarkMode = ref.watch(themeProvider);
    // ** Utilizando un NotifierProvider se veria asi
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Changer"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                // ** Esto sirve para el control conestados simples
                // ref.read(themeProvider.notifier).update(
                //       (isDarkMode) => !isDarkMode,
                //     );
                // ** Utilizando un NotifierProvider se veria asi
                // !! Cuando usamos el NotifierProvider el metodo acaa es WATCH, no read
                ref.watch(themeNotifierProvider.notifier).toggleDarkmode();
              },
              icon: isDarkMode
                  ? const Icon(Icons.light_mode_outlined)
                  : const Icon(Icons.dark_mode_outlined),
            ),
          ),
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ** por si algun dia lo volvemos dinamico, es mejor siempre utilizar el <watch>
    final List<Color> colors = ref.watch(colorListProvider);

    // ** Esto sirve para el control conestados simples
    // final selectedIndexColor = ref.watch(selectedIndexColorProvider);
    // ** Con el NotifierProvider seria asi:
    final int selectedIndexColor =
        ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];

        return RadioListTile(
          title: Text(
            "Este color ",
            style: TextStyle(
              color: color,
            ),
          ),
          subtitle: Text(
            "Color ${color.value}",
            style: TextStyle(
              color: color,
            ),
          ),
          activeColor: color,
          value: index,
          groupValue: selectedIndexColor,
          onChanged: (value) {
            print("VALOR SELECCIONADO $value");
            // ** Esto sirve para el control conestados simples
            // ref
            //     .read(selectedIndexColorProvider.notifier)
            //     .update((state) => index);
            // ** Utilizando un NotifierProvider se veria asi
            // !! Cuando usamos el NotifierProvider el metodo acaa es WATCH, no read
            ref.watch(themeNotifierProvider.notifier).changeColorIndex(index);
          },
        );
      },
    );
  }
}
