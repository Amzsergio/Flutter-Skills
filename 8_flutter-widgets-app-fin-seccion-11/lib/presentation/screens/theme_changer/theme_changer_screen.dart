import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkmode = ref
        .watch(themeNotifierProvider)
        .isDarkmode; // Aqui estamos pendiente de nuestro themeNotifier. **Riverpod

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme changer'),
        actions: [
          IconButton(
              icon: Icon(isDarkmode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              onPressed: () {
                // ref.read(isDarkmodeProvider.notifier)
                //   .update((state) => !state );
                ref
                    .read(themeNotifierProvider.notifier)
                    .toggleDarkmode(); //Pongo .notifier porque quiero ingresara los métodos del mismo y ya quedamos conectados con los estados. **Riverpod
              })
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(
        colorListProvider); // !aunque el color es inmutable, no pueden cambiar debido a que es un Provider, la documentación recomienda usar watch en lugar de read, por ejemplo si en algún momemento queremos hacerlo dinámico no debemos hacer estos cambios. **Riverpod
    final int selectedColor = ref
        .watch(themeNotifierProvider)
        .selectedColor; //! Esto es lo mismo que final AppTheme appTheme = ref.watch( themeNotifierProvider ); -> appTheme.selectedColor
    // final int selectedColor = ref.watch( selectedColorProvider );

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];

        return RadioListTile(
          // Esto me devuelve varios RadioLisTile, segun cada color. **Ctaxi
          title: Text('Este color', style: TextStyle(color: color)),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index,
          groupValue:
              selectedColor, // !esto es para mantener la persistencia del color seleccionado. **Riverpod
          onChanged: (value) {
            // ref.read(selectedColorProvider.notifier).state = index;
            ref.watch(themeNotifierProvider.notifier).changeColorIndex(index);
          },
        );
      },
    );
  }
}
