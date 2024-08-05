import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';// Instalar la dependencia de Flutter-Riverpod **Riverpod // Aquí está la documentación de la nueva versión de riverPod al final de este archivo se encuentra los pros y contras.  https://docs-v2.riverpod.dev/docs/concepts/about_code_generation  **Tools **Riverpod
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(// Widget que mantiene una referencia a todos los provider que usemos.f **Riverpod
      child: MainApp()
    )
  );
}

class MainApp extends ConsumerWidget {// Aqui cambiamos de Stateles a Consumer widget para poder manejar el estado de darkmode. //!A
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref ) {

    // final isDarkmode = ref.watch(isDarkmodeProvider); //!A
    // final selectedColor = ref.watch(selectedColorProvider); //!A
    final AppTheme appTheme = ref.watch( themeNotifierProvider ); //! Unma vez creado mi ThemeNotifier, elimino las dos anteriores lineas y ahora voy a estar escuchando el themeNotifierProvider

    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
    );
  }
}

//PROS Y CONTRAS DE LA ÚLTIMA ACTUALIZACIÓN DE RIVERPOD

// Riverpod annotations y generador de código
// Como varios sabrán, Riverpod no hace mucho lanzó una nueva sintaxis, (No marca como obsoleta la anterior sintaxis) significa que ahora tenemos dos formas de usarlo.

// La nueva versión utiliza decoradores y anotaciones que ayudan al generador de código para crear el provider ideal para lo que queremos hacer.

// Tiene pro y contras esta nueva versión de código:

// Pros:

// Es la forma recomendada por Riverpod

// Sintaxis mucho más simple

// Determina automáticamente el provider acorde a la necesidad

// Cons:

// Hay que mantener un watch o ejecutar el generador en cada cambio que hagamos en los providers

// flutter pub run build_runner watch

// Un paquete adicional de riverpod_generator como dependencia de desarrollo (que realmente no es gran problema)

// Pueden ver los ejercicios de una u otra sintaxis con el switch que colocaron en el sitio web de Riverpod

