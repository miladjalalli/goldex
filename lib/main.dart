import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goldex/presentation/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum StateManagementOptions {
  cubit,
}

late SharedPreferences sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  Animate.restartOnHotReload = true;

  runApp(HomeScreen());
}
