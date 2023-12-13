import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

// ** <ConsumerWidget> Permite a Riverpod hacer seguimiento a un StatelessWidget. Al final se podria decir que son lo mismo, solo que Riverpod arega funcionalidad para incluir la funcionalidad de provider a este widget (ver doc. Riverpod)
class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  // ** <WidgetRef ref>  Este parametro en el build, debe ser incluido cuando se convierte en un ConsumerWidget, es obligatorio!!!
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme.titleLarge;

    // ** registramos el provider que vamos a monitorizar en este caso [counterProvider]
    // !! watch no se debe usar dentro de metodos
    final int clickValue = ref.watch(counterProvider);
    // ** gestor del darkmode action
    final bool isDarkMode = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Counter screen",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                // ** OPTION 1
                // ref.read(themeProvider.notifier).state = !ref.read(themeProvider.notifier).state;
                // ** OPTION 2 Para este caso queda mas entendible esto
                ref.read(themeProvider.notifier).update(
                      (isDarkMode) => !isDarkMode,
                    );
              },
              icon: isDarkMode
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.light_mode_outlined),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Contador valor: $clickValue",
          style: textStyle,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ** De esta forma con Riverpord accedemos al estado del proviuder y modificamos el mismo, notifier es obligatorio
          ref.read(counterProvider.notifier).state++;
          // ** ALTERNATIVA a la actualizacion de estado, es indistinto cual se use
          // ref.read(counterProvider.notifier).update((state) => state++);
        },
        child: const Icon(Icons.plus_one_outlined),
      ),
    );
  }
}
