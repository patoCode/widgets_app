import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Utilizaremos el <appMenuItems> definido anteriormente
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final item = appMenuItems[index];
        return _CustomListTile(item: item);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.item,
  });

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        item.icon,
        color: color.primary,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_sharp,
        color: color.primary,
      ),
      title: Text(item.title),
      subtitle: Text(item.subTitle),
      onTap: () {
        // TODO navegar a otra pantalla
      },
    );
  }
}
