import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackBar(BuildContext ctx) {
    // ** Evita el apilamiento de snackbars, es decir cada que se abre un snackbar se cierra el anterior
    ScaffoldMessenger.of(ctx).clearSnackBars();
    // ** Se separa solo por tema de legibilidad de codigo
    final snackBar = SnackBar(
      content: const Text("Mensaje!!!"),
      // ** Cualquier accion en el snackbar ocaciona q este se cierre
      action: SnackBarAction(
        label: 'ACTION',
        onPressed: () {},
      ),
      duration: const Duration(
        seconds: 2,
      ),
    );
    ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
  }

  void openDialog(BuildContext ctx) {
    showDialog(
      context: ctx,
      // ** barrierDismissible >> Obliga a cerrar el dialog presionando un boton
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Estas seguro?"),
        content: const Text(
            "Amet elit ea aliqua magna irure ea ullamco sunt. Nisi ipsum esse do nulla mollit fugiat. Sint veniam nulla commodo et."),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text("Cancelar"),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text("Aceptar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbars"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(
                      "Veniam minim reprehenderit eiusmod sit. Nisi pariatur amet laborum consequat velit id nostrud elit aute officia mollit do. Ullamco laboris sit amet cillum aliqua aliquip excepteur et officia veniam dolore eu irure. Aliquip anim esse enim do in consequat aute nisi velit qui laboris in. Enim quis aliquip et mollit adipisicing quis exercitation do do laborum ea ut proident id. Velit anim in culpa commodo qui ex reprehenderit. Occaecat tempor ut anim nostrud sint enim consequat velit dolor Lorem cillum.",
                    ),
                  ],
                );
              },
              child: const Text("Licencias Usadas!"),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text("Mostrar dialogos de pantalla"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackBar(context),
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text("Mostrar snackbar"),
      ),
    );
  }
}
