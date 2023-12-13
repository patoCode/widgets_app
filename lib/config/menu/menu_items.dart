import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: "Botones",
    subTitle: "Varios Botones Flutter",
    link: "/buttons",
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: "Tarjetas",
    subTitle: "Contenedor utilizado",
    link: "/cards",
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: "Progress",
    subTitle: "Generales y controlados",
    link: "/progress",
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: "Snackbars y dialogos",
    subTitle: "Mensajes y alertas",
    link: "/snackbars",
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: "UI Controls + Titles",
    subTitle: "Serie de controles en Flutter",
    link: "/ui-controls",
    icon: Icons.color_lens,
  ),
  MenuItem(
    title: "Introduccion a la APP",
    subTitle: "Tutorial introductorio",
    link: "/tutorial",
    icon: Icons.accessibility_rounded,
  ),
  MenuItem(
    title: "Infinite Scroll y Pull",
    subTitle: "Infinite scroll and pull to refresh",
    link: "/infinite",
    icon: Icons.list_alt_rounded,
  ),
  MenuItem(
    title: "Counter con Riverpod",
    subTitle: "Introduccion a Riverpod",
    link: "/counter",
    icon: Icons.numbers,
  ),
  MenuItem(
    title: "Theme Changer",
    subTitle: "cambiar el color del theme con Riverpod",
    link: "/theme_changer",
    icon: Icons.color_lens_outlined,
  ),
];
