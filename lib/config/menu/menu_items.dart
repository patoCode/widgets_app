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
];
