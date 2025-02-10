import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/core/theme/theme.dart';

import '../presentation/assets.dart';

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
        color: Theme.of(context).colorScheme.onSurface,
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
          _buildIcon(Asset.profile, 0, screenWidth),
          _buildIcon(Asset.service, 1, screenWidth),
          _buildIcon(Asset.wallet, 2, screenWidth),
          _buildIcon(Asset.transaction, 3, screenWidth),
        ],
      ),
    );
  }

  Widget _buildIcon(String icon, int index, double screenWidth) {
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
          child: SvgPicture.asset(
            icon,
            fit: BoxFit.cover,
            color: isSelected ? Theme.of(context).colorScheme.onSurface : Colors.grey,
            width: screenWidth * 0.08,
            height: screenWidth * 0.08,
          ),
        ),
      ),
    );
  }
}
