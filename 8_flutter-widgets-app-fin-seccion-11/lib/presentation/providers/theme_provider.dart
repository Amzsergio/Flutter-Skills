import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Listado de colores inmutable //!Esto es el seteo de la lista de colores que viene de app_theme.dart y se usa Provider para indicar que esto es inmutable, es decir no puede cambiar. **Riverpod
final colorListProvider = Provider((ref) => colorList);

// Un simple boolean
final isDarkmodeProvider = StateProvider((ref) => false);

// Un simple int
final selectedColorProvider = StateProvider((ref) => 0); // StateProvider es para mantener una pieza del estado. **Riverpod




// Un objeto de tipo AppTheme (custom) //! Esto es para estar pendiente de AppTheme, StateNotifierProvider se usa para mantener el estado de un objeto mas elaborado.  **Riverpod
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(), //!este themeNotifier inicializa un AppNotifier que es el que se devuelve. //*Aquí se puede enviar la semilla de colores en la primera instancia de themeNotifer
);//!El que controla es ThemeNotifier y el estado es de tipo AppTheme


// Controller o Notifier //!Se encarga de mantener una instancia de AppTheme
class ThemeNotifier extends StateNotifier<AppTheme> {// También se podría poner ThemeController **Riverpod
  
  // !STATE = Estado = new AppTheme();
  ThemeNotifier(): super( AppTheme() );// Crear la instancia de Apptheme con sus valores por defecto, lo que es el estado. **Riverpod


  void toggleDarkmode() { //!si se recibiera el ref del ThemeNotifier entonces aqui se podria usar como ref.read... y estar pendiente **Riverpod
    state = state.copyWith( isDarkmode: !state.isDarkmode  ); // El nuevo estado es un copia del estado anterior, Riverpod se da cuenta que el state cambia yse encarga de hacer toda la actualización. **Riverpod **AppExp
  }

  void changeColorIndex( int colorIndex) {
    state = state.copyWith( selectedColor: colorIndex );
  }


}
