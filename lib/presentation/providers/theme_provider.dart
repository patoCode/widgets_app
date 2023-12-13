import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final themeProvider = StateProvider((ref) => false);

// **  estado de colores inmutables, es decir no se puede cambiar, para esto utilizarmos el Provider
// !! Este Provider no se puede cambiar a lo largo de la vida de la APP
final colorListProvider = Provider((ref) => colorList);

// ** Para guardar el indice del color seleccionado
final selectedIndexColorProvider = StateProvider((ref) => 0);

// ** <StateNotifierProvider> se usa cuando el estado qe se va a controlar es una clase
// ** Esto significa <ThemeNotifier, Apptheme> ==> <Quien controla, De que tipo es la instancia de estado>
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  // ** ThemeNotifier() : super(AppTheme()) ==> indica que al crear una instancia de ThemeNotifier, automaticamente se creara una instancia de AppTheme()
  ThemeNotifier() : super(AppTheme());

  // ** Esta funcion controlara el estado del togle de DarkMode, es el notifier que sera usado en el read cuando querramos acceder al estado
  void toggleDarkmode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int selectedColor) {
    state = state.copyWith(selectedColor: selectedColor);
  }
}
