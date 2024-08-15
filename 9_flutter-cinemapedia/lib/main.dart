import 'package:flutter/material.dart';

import 'package:cinemapedia/config/router/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:cinemapedia/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await dotenv.load(
      fileName:
          '.env'); // Así es como uso env en flutter con la dependencia, tener en cuenta que flutter no las lee si se cambian en tiempos de ejecución.

  runApp(const ProviderScope(
      child: MainApp())); // Esta es la configuración de **Riverpod
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false, // setear el debug mode **Step 1
      theme: AppTheme().getTheme(), // llamar el tema **Step 3
    );
  }
}


// Entidades son objetos que son y serán idénticos entre diferentes aplicaciones de nuestra empresa. **Concept
// DataSources , fuente de datos, no debería de importar dónde venga la data. **Concept
// Repositorios , llaman a los origenes d los datos. 
// Gestor de Datos es el puente enter todo lo anterior y mi UI. **Concept