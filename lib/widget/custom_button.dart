import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double width;
  final Color borderColor;
  final VoidCallback onPressed;
  final BorderRadiusGeometry borderRadius;
  final TextStyle textStyle;
  final IconData? icon;
  final bool isIconEnabled;

  const CustomButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.height,
    required this.width,
    required this.borderColor,
    required this.onPressed,
    this.borderRadius = const BorderRadius.all(Radius.circular(25.0)), // Default borderRadius
    this.textStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Default textStyle
    this.icon,
    this.isIconEnabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          minimumSize: Size(double.infinity, height),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: BorderSide(color: borderColor),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: textStyle.copyWith(color: textColor),
            ),
            if (isIconEnabled && icon != null) ...[
              const SizedBox(width: 8),
              Icon(
                icon,
                color: textColor,
                size: 20,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Button Example'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: "Share",
                backgroundColor: Colors.green,
                textColor: Colors.white,
                height: 50,
                width: 200,
                borderColor: Colors.green,
                onPressed: () {
                  print("Share button clicked!");
                },
                isIconEnabled: true,
                icon: Icons.share,
              ),
              SizedBox(height: 20),
              CustomButton(
                text: "No Icon",
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                height: 50,
                width: 200,
                borderColor: Colors.blue,
                onPressed: () {
                  print("Button without icon clicked!");
                },
                isIconEnabled: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
