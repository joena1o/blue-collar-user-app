import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeLight()) {
    on<ToggleTheme>((ToggleTheme event, Emitter<ThemeState> emit) {
      if (event.isDark) {
        emit(ThemeLight());
      } else {
        emit(ThemeDark());
      }
    });
  }
}
