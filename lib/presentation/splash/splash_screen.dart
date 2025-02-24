import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goldex/core/theme/theme.dart';
import 'package:goldex/presentation/home/home_screen.dart';
import 'package:goldex/presentation/splash/cubit/splash_cubit.dart';
import 'dart:async';
import '../../core/assets.dart';
import '../../core/dependency_injection.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return  BlocConsumer<SplashCubit, SplashState>(
          listener: (context, state)  {
            SplashCubit cubit = context.read<SplashCubit>();

            if(state is SplashLoggedIn){
              Timer(const Duration(seconds: 3), () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              });
            }
            if(state is SplashDontLoggedIn){
              Timer(const Duration(seconds: 3), () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              });
            }
          },
          builder: (context, state) {
            SplashCubit cubit = context.read<SplashCubit>();
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.surface,
              body: Stack(
                children: [
                  Positioned.fill(
                    child: SvgPicture.asset(
                      Asset.splash, // مسیر فایل SVG شما
                      fit: BoxFit.cover, // یا BoxFit.fill بسته به نیاز شما
                    ),
                  ),
                ],
              ),
            );
          },
        );

  }
}

class SemiCircleUpPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = colorGreen
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    double cx = size.width / 2;
    double cy = size.height;
    double r = 200;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: r),
      0,
      3.14,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
class SemiCircleFirstBottomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = colorGreen
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    double cx = size.width;
    double cy = size.height;
    double r = 200;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: r),
      3.14,
      3.14,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
class SemiCircleSecondBottomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = colorGreen
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    double cx = size.width;
    double cy = size.height;
    double r = 180;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: r),
      3.14,
      3.14,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
