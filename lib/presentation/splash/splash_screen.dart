import 'package:flutter/material.dart';
import 'package:goldex/theme/theme.dart';
import 'dart:async';
import '../assets.dart';
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
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Up
          Positioned(
            top: -250,
            left: -100,
            child: CustomPaint(
              size: const Size(250, 250),
              painter: SemiCircleUpPainter(),
            ),
          ),
          // First Bottom
          Positioned(
            bottom: 0,
            right: 10,
            child: CustomPaint(
              size: const Size(250, 250),
              painter: SemiCircleFirstBottomPainter(),
            ),
          ),
          // Second Bottom
          Positioned(
            bottom: 0,
            right: 90,
            child: CustomPaint(
              size: const Size(250, 250),
              painter: SemiCircleSecondBottomPainter(),
            ),
          ),
          // Logo
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Asset.logo,
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Goldex App',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
