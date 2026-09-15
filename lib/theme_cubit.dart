import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_hub_flutter/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(isDark: false));

  void toggleTheme() {
    emit(ThemeState(isDark: !state.isDark));
  }
}
