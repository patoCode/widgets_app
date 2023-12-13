import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final themeProvider = StateProvider((ref) => false);

// **  estado de colores inmutables, es decir no se puede cambiar, para esto utilizarmos el Provider
// !! Este Provider no se puede cambiar a lo largo de la vida de la APP
final colorListProvider = Provider((ref) => colorList);

// ** Para guardar el indice del color seleccionado
final selectedIndexColorProvider = StateProvider((ref) => 0);
