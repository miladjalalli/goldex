import 'package:flutter/material.dart';
import 'package:goldex/theme/theme.dart';

class CustomBottomBar extends StatefulWidget {
  final Function(int) onItemSelected;

  const CustomBottomBar({super.key, required this.onItemSelected});

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
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
          _buildIcon(Icons.person, 0, screenWidth),
          _buildIcon(Icons.group, 1, screenWidth),
          _buildIcon(Icons.account_balance_wallet, 2, screenWidth),
          _buildIcon(Icons.home, 3, screenWidth),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index, double screenWidth) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        widget.onItemSelected(index);
      },
      child: Container(
        width: screenWidth * 0.16,
        height: screenWidth * 0.16,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : colorDarkGreyNavigation,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: (isSelected ? Colors.green : colorDarkGreyNavigation)
                  .withOpacity(0.3),
              blurRadius: 15,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            color: isSelected ? Colors.black : Colors.grey,
            size: screenWidth * 0.08,
          ),
        ),
      ),
    );
  }
}
