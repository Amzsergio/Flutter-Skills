import 'package:flutter/material.dart';
import 'package:widgets_app/config/router/app_router.dart'; // Go_router **Routes
import 'package:widgets_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title:
          'Flutter Widgets', // Este título aparece en el dialogo de las licencias que se encuentra predeterminado en flutter con showAboutDialog **Widget
      routerConfig:
          appRouter, // Aquí se encuentra las rutas de Go_router **Routes
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).getTheme(),
    );
  }
}
