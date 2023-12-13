import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    super.key,
    required this.scaffoldKey,
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  // ** Para saber que opcion del menu esta activa
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    // ** <MediaQuery.of(context).viewPadding.top> se puede determinar si hay notch o no. Por ejemplo si este valor es mayor a 35 "hay notch"
    final hasNotch = MediaQuery.of(context).viewPadding.top;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      // ** Permite marcar el item activo, esto lo gestiona el drawer automaticamente, pero no olvidar el setState
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final item = appMenuItems[value];
        context.push(item.link);
        // ** con el key del <HomeScreen> cerramos el drawer, pero verificamos si antes este DRAWER existe
        // ** para saber si existe utilizamos el signo ? .
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(15, hasNotch > 35 ? 5 : 20, 10, 20),
          child: const Text("Main Menu"),
        ),
        ...appMenuItems.sublist(0, 3).map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 28, 16),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 10, 20),
          child: Text("Secondary Menu"),
        ),
        ...appMenuItems.sublist(3).map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
      ],
    );
  }
}
