import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldex/app_localizations.dart';
import 'package:goldex/presentation/home/home_screen.dart';
import 'package:goldex/theme/theme.dart';
import '../../widget/custom_button.dart';
import '../../widget/dotter_painter.dart';
import '../assets.dart';
import '../sign_up/cubit/sing_up_cubit.dart';
import '../sign_up/sign-up_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: DottedBackgroundPainter(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      Asset.headerLogo,
                      width: 80,
                      height: 80,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(61, 0, 61, 17),
                    child: Column(
                      children: [
                        Text(
                          context.translate('signInToYourAccount'),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          context.translate('enterYourEmailAndPasswordToLogIn'),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.fromLTRB(21, 43, 21 , 35),
                    decoration: BoxDecoration(
                      color: colorLightGrey,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 25,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Email field
                        TextField(
                          decoration: InputDecoration(
                            hintText: context.translate('email'),
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Colors.white, width: 1.5), // رنگ border پیش‌فرض
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Colors.blue, width: 2.0), // رنگ border هنگام فوکوس
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: context.translate('Password'),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.visibility_off),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Colors.white, width: 1.5), // رنگ border پیش‌فرض
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Colors.blue, width: 2.0), // رنگ border هنگام فوکوس
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(value: false, onChanged: (val) {}),
                                Text(context.translate('rememberMe')),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                // Handle forgot password
                              },
                              child: Text(
                                context.translate('forgotPassword'),
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        CustomButton(
                          text: context.translate('logIn'),
                          backgroundColor: colorGreen,
                          textColor: Colors.white,
                          height: 50,
                          width: 300,
                          borderColor: colorGreen,
                          borderRadius: BorderRadius.circular(25),
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                              MaterialPageRoute(builder: (context) => HomeScreen()),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    context.translate('dontHaveAnAccount'),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomButton(
                    text: context.translate('signUp'),
                    backgroundColor: Colors.transparent,
                    textColor: Colors.white,
                    height: 50,
                    width: 300,
                    borderColor: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) {
                                return BlocProvider<SingUpCubit>(
                                  create: (context) => SingUpCubit(),
                                  child: const SignUpScreen(),
                                );
                              }));
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




