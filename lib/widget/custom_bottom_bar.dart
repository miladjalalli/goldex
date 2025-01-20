import 'package:flutter/material.dart';
import 'package:goldex/theme/theme.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    // دریافت عرض صفحه
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: 320,
      height: screenWidth * 0.2,
      margin: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(screenWidth * 0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 25,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIcon(Icons.person, Colors.white, colorDarkGreyNavigation, screenWidth),
          _buildIcon(Icons.group, Colors.white, colorDarkGreyNavigation, screenWidth),
          _buildIcon(Icons.account_balance_wallet, Colors.white, colorDarkGreyNavigation, screenWidth),
          _buildIcon(Icons.home, Colors.green, colorDarkGreyNavigation, screenWidth),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon, Color iconColor, Color backgroundColor, double screenWidth) {
    return Container(
      width: screenWidth * 0.16,
      height: screenWidth * 0.16,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(0.3),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          icon,
          color: iconColor,
          size: screenWidth * 0.06,
        ),
      ),
    );
  }
}
