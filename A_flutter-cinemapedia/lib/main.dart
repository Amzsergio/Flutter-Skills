import 'package:flutter/material.dart';

import 'package:cinemapedia/config/router/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:cinemapedia/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}


// El error que tenía era que aparecía Initializin gradle para siempre, después de haber dado restart cuando aparecía "No Connection to gradle server. Try restarting the server (Gradle for Java) "
// Realicé la busqueda en internet pero ninguna de las opciones incluyendo hacer un gradle --clean sirvieron. Lo único que funcionó fue desinstalar las extensiones de dart, flutter y gradle y reinstalar dart y flutter sin gradle. **Errors