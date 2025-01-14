import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:goldex/presentation/home/home_screen.dart';
import 'package:goldex/theme/theme.dart';
import 'package:goldex/theme/theme_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_localizations.dart';

enum StateManagementOptions {
  cubit,
}

late SharedPreferences sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  Animate.restartOnHotReload = true;

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, AppThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              // Add your localization delegate
              AppLocalizationsDelegate(),
            ],
            supportedLocales: [
              const Locale('en', ''), // English
              const Locale('fa', ''), // Spanish
            ],
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode == AppThemeMode.light
                ? ThemeMode.light
                : ThemeMode.dark,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
