import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons Screen"),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ** Esta accion permite volver atras, pero solo porque tenemos implementado go_router
          context.pop();
        },
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: SizedBox(
        width: double.infinity,
        // ** [WRAP] Funciona como un contenedor, pero es dinamico ya que va creando lineas segun su contenido
        child: Wrap(
          // ** Agrega espacio al rededor de CADA elemento dentro del WRAP
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("Elevated Button"),
            ),
            const ElevatedButton(
              // ** para deshabilitar un boton solo se le envia null en el onPress
              onPressed: null,
              child: Text("Elevated Disabled"),
            ),
            ElevatedButton.icon(
              // ** para deshabilitar un boton solo se le envia null en el onPress
              onPressed: () {},
              label: const Text("Elevated Disabled"),
              icon: const Icon(Icons.access_alarm_rounded),
            ),
            FilledButton(
              onPressed: () {},
              child: const Text("Filled Button"),
            ),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.woo_commerce_rounded),
              label: const Text("Filled Icon"),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text("OutlineButton"),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_reaction_sharp),
              label: const Text("Icon Outline Btn"),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Text Button"),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.video_library_rounded),
              label: const Text("Text Button"),
            ),
            // TODO Custom Button
            const CustomButton(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.watch_outlined,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.watch_outlined,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(color.primary),
                iconColor: MaterialStatePropertyAll(color.onPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    // ** ClipRRect permite los bordes redondeados
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: color.primary,
        // ** InkWell Permite la animacion al presionar
        child: InkWell(
          onTap: () {},
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Text(
                "Custom Button",
                style: TextStyle(
                  color: color.onPrimary,
                ),
              )),
        ),
      ),
    );
  }
}
