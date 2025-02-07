import 'package:flutter_bloc/flutter_bloc.dart';

enum AppThemeMode { light, dark }

class ThemeCubit extends Cubit<AppThemeMode> {
  ThemeCubit() : super(AppThemeMode.light);

  void toggleTheme() {
    if (state == AppThemeMode.light) {
      emit(AppThemeMode.dark);
    } else {
      emit(AppThemeMode.light);
    }
  }
}
