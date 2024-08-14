import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.subTitle,
    required this.link,
    required this.icon,
    required this.title,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'App Theme Settings',
    subTitle: '',
    link: '',
    icon: null,
  ),
];
