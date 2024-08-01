import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
// documentación para routing **Tools https://docs.flutter.dev/ui/navigation
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return MaterialApp(
    //   routes: {
    //     // '/buttons': ((context) => const ButtonsScreen(),
    //     // '/cards': ((context) => const CardsScreen(),
    //   },
    // ); //!//!Este tipo de navegación es común encontrarla sin embargo desde la misma página de flutter no se recomienda por sus limitaciones ** Routes **Practice ver cuales son sus limitaciones. **Routes

    // final isDarkmode = ref.watch(isDarkmodeProvider);
    // final selectedColor = ref.watch(selectedColorProvider);
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(//Esta es la manera de implementar go?router **Routes
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
    );
  }
}
